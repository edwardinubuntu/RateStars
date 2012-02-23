//
//  UIImageView+Reflected.h
//  IndieVox
//
//  Created by Edward Chiang on 11/12/5.
//  Copyright (c) 2011年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Reflected)

+ (UIImage *)reflectedImage:(UIImageView *)fromImage withHeight:(NSUInteger)height;

@end
