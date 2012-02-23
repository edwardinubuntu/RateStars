//
//  UIImageView+Reflected.m
//  IndieVox
//
//  Created by Edward Chiang on 11/12/5.
//  Copyright (c) 2011年 Polydice Inc. All rights reserved.
//

#import "UIImageView+Reflected.h"

@implementation UIImageView (IndieVox)

CGContextRef createBitmapContext(int pixelsWide, int pixelsHigh) {
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  
  // create the bitmap context
  CGContextRef bitmapContext = CGBitmapContextCreate (NULL, pixelsWide, pixelsHigh, 8,
                                                      0, colorSpace,
                                                      // this will give us an optimal BGRA format for the device:
                                                      (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
  CGColorSpaceRelease(colorSpace);
  
  return bitmapContext;
}

CGImageRef createGradientImage(int pixelsWide, int pixelsHigh) {
  CGImageRef theCGImage = NULL;
  
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
  
  CGContextRef gradientBitmapContext = CGBitmapContextCreate(NULL, pixelsWide, pixelsHigh,
                                                             8, 0, colorSpace, kCGImageAlphaNone);
  
  CGFloat colors[] = {0.0, 1.0, 1.0, 1.0};
  
  CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
  CGColorSpaceRelease(colorSpace);
  
  CGPoint gradientStartPoint = CGPointZero;
  CGPoint gradientEndPoint = CGPointMake(0, pixelsHigh);
  
  CGContextDrawLinearGradient(gradientBitmapContext, grayScaleGradient, gradientStartPoint,
                              gradientEndPoint, kCGGradientDrawsAfterEndLocation);
  CGGradientRelease(grayScaleGradient);
  
  theCGImage = CGBitmapContextCreateImage(gradientBitmapContext);
  CGContextRelease(gradientBitmapContext);
  
  return theCGImage;
}

+ (UIImage *)reflectedImage:(UIImageView *)fromImage withHeight:(NSUInteger)height {
  if (height == 0)
    return nil;
  
  // create a bitmap graphics context the size of the image
  CGContextRef mainViewContentContext = createBitmapContext(fromImage.bounds.size.width, height);
  
  CGImageRef gradientMaskImage = createGradientImage(1, height);
  
  CGContextClipToMask(mainViewContentContext, CGRectMake(0.0, 0.0, fromImage.bounds.size.width, height), gradientMaskImage);
  CGImageRelease(gradientMaskImage);
  
  CGContextTranslateCTM(mainViewContentContext, 0.0, height);
  CGContextScaleCTM(mainViewContentContext, 1.0, -1.0);
  
  CGContextDrawImage(mainViewContentContext, fromImage.bounds, fromImage.image.CGImage);
  
  CGImageRef reflectionImage = CGBitmapContextCreateImage(mainViewContentContext);
  CGContextRelease(mainViewContentContext);
  
  UIImage *theImage = [UIImage imageWithCGImage:reflectionImage];
  
  CGImageRelease(reflectionImage);
  
  return theImage;
}

@end
