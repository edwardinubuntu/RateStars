//
//  RSTapRateView.h
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

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