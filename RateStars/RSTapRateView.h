//
//  RSTapRateView.h
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

/*
 Copyright (C) 2012 Edward Chiang
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <UIKit/UIKit.h>

@protocol RSTapRateViewDelegate;

@interface RSTapRateView : UIView

@property (nonatomic, assign) id<RSTapRateViewDelegate> delegate;

@property (nonatomic, retain) UIButton *oneStarButton;
@property (nonatomic, retain) UIButton *twoStarButton;
@property (nonatomic, retain) UIButton *threeStarButton;
@property (nonatomic, retain) UIButton *fourStarButton;
@property (nonatomic, retain) UIButton *fiveStarButton;

@property (nonatomic, retain) UIImageView *oneStarReflectionView;
@property (nonatomic, retain) UIImageView *twoStarReflectionView;
@property (nonatomic, retain) UIImageView *threeStarReflectionView;
@property (nonatomic, retain) UIImageView *fourStarReflectionView;
@property (nonatomic, retain) UIImageView *fiveStarReflectionView;

@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, assign) NSInteger rating;

- (void)clean;

@end

@protocol RSTapRateViewDelegate
@optional
- (void)tapDidRateView:(RSTapRateView*)view rating:(NSInteger)rating;
@end