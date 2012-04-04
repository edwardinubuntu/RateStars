//
//  RSTapRateView.m
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "RSTapRateView.h"
#import "UIImageView+Reflected.h"

@implementation RSTapRateView

@synthesize textLabel = _textLabel;
@synthesize oneStarButton = _oneStarButton;
@synthesize twoStarButton = _twoStarButton;
@synthesize threeStarButton = _threeStarButton;
@synthesize fourStarButton = _fourStarButton;
@synthesize fiveStarButton = _fiveStarButton;
@synthesize rating = _rating;
@synthesize delegate = _delegate;

@synthesize oneStarReflectionView = _oneStarReflectionView;
@synthesize twoStarReflectionView = _twoStarReflectionView;
@synthesize threeStarReflectionView = _threeStarReflectionView;
@synthesize fourStarReflectionView = _fourStarReflectionView;
@synthesize fiveStarReflectionView = _fiveStarReflectionView;

#define kTextLabelText @"Tap a Star to Rate"

static const CGFloat    kDefaultReflectionFraction = 3.00;
static const CGFloat    kDefaultReflectionOpacity = 0.30;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code

    _rating = 0;

    _textLabel = [[UILabel alloc] init];
    _textLabel.text = kTextLabelText;
    _textLabel.font = [UIFont boldSystemFontOfSize:10.f];
    _textLabel.textColor = [UIColor grayColor];
    _textLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_textLabel];

    _oneStarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_oneStarButton setImage:[UIImage imageNamed:@"star_empty.png"] forState:UIControlStateNormal];
    [_oneStarButton setImage:[UIImage imageNamed:@"star_full.png"] forState:UIControlStateSelected];
    [_oneStarButton addTarget:self action:@selector(tapStarButton:) forControlEvents:UIControlEventTouchUpInside];
    _oneStarButton.tag = 1;
    [self.oneStarButton sizeToFit];
    [self addSubview:_oneStarButton];

    _oneStarReflectionView = [[UIImageView alloc] init];
    _oneStarReflectionView.alpha = kDefaultReflectionOpacity;
    [self addSubview:_oneStarReflectionView];
  
    _twoStarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_twoStarButton setImage:[UIImage imageNamed:@"star_empty.png"] forState:UIControlStateNormal];
    [_twoStarButton setImage:[UIImage imageNamed:@"star_full.png"] forState:UIControlStateSelected];
    [_twoStarButton addTarget:self action:@selector(tapStarButton:) forControlEvents:UIControlEventTouchUpInside];
    _twoStarButton.tag = 2;
    [self.twoStarButton sizeToFit];
    [self addSubview:_twoStarButton];

    _twoStarReflectionView = [[UIImageView alloc] init];
    _twoStarReflectionView.alpha = kDefaultReflectionOpacity;
    [self addSubview:_twoStarReflectionView];

    _threeStarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_threeStarButton setImage:[UIImage imageNamed:@"star_empty.png"] forState:UIControlStateNormal];
    [_threeStarButton setImage:[UIImage imageNamed:@"star_full.png"] forState:UIControlStateSelected];
    [_threeStarButton addTarget:self action:@selector(tapStarButton:) forControlEvents:UIControlEventTouchUpInside];
    _threeStarButton.tag = 3;
    [self.threeStarButton sizeToFit];
    [self addSubview:_threeStarButton];

    _threeStarReflectionView = [[UIImageView alloc] init];
    _threeStarReflectionView.alpha = kDefaultReflectionOpacity;
    [self addSubview:_threeStarReflectionView];

    _fourStarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fourStarButton setImage:[UIImage imageNamed:@"star_empty.png"] forState:UIControlStateNormal];
    [_fourStarButton setImage:[UIImage imageNamed:@"star_full.png"] forState:UIControlStateSelected];
    [_fourStarButton sizeToFit];
    [_fourStarButton addTarget:self action:@selector(tapStarButton:) forControlEvents:UIControlEventTouchUpInside];
    _fourStarButton.tag = 4;
    [self addSubview:_fourStarButton];
    
    _fourStarReflectionView = [[UIImageView alloc] init];
    _fourStarReflectionView.alpha = kDefaultReflectionOpacity;
    [self addSubview:_fourStarReflectionView];

    _fiveStarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_fiveStarButton setImage:[UIImage imageNamed:@"star_empty.png"] forState:UIControlStateNormal];
    [_fiveStarButton setImage:[UIImage imageNamed:@"star_full.png"] forState:UIControlStateSelected];
    [_fiveStarButton addTarget:self action:@selector(tapStarButton:) forControlEvents:UIControlEventTouchUpInside];
    _fiveStarButton.tag = 5;
    [_fiveStarButton sizeToFit];
    [self addSubview:_fiveStarButton];

    _fiveStarReflectionView = [[UIImageView alloc] init];
    _fiveStarReflectionView.alpha = kDefaultReflectionOpacity;
    [self addSubview:_fiveStarReflectionView];

    self.backgroundColor = [UIColor colorWithHue:0.611 saturation:0.026 brightness:0.922 alpha:1.];

  }
  return self;
}

- (void)dealloc {
  [_textLabel release];
  [_oneStarReflectionView release];
  [_twoStarReflectionView release];
  [_threeStarReflectionView release];
  [_fourStarReflectionView release];
  [_fiveStarReflectionView release];
  [super dealloc];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [_textLabel sizeToFit];

  CGFloat starButtonWidth = 24.f;
  CGFloat starButtonHeight = 24.f;
  CGFloat starButtonSpacing = 20.f;
  CGFloat centerButtonLeft = (self.bounds.size.width - starButtonWidth) / 2;
  CGFloat centerButtonTop = (self.bounds.size.height - starButtonHeight) / 2;
  
  // One
  self.oneStarButton.frame = CGRectMake(centerButtonLeft - (starButtonSpacing + starButtonWidth) * 2, centerButtonTop, starButtonWidth, starButtonHeight);

  _oneStarReflectionView.image = [UIImageView reflectedImage:_oneStarButton.imageView withHeight:_oneStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  _oneStarReflectionView.frame = CGRectMake(centerButtonLeft - (starButtonSpacing + starButtonWidth) * 2, centerButtonTop +  starButtonHeight + 1.f, starButtonWidth, starButtonHeight);

  // Two
  self.twoStarButton.frame = CGRectMake(centerButtonLeft - (starButtonSpacing + starButtonWidth) * 1, centerButtonTop, starButtonWidth, starButtonHeight);

  _twoStarReflectionView.image = [UIImageView reflectedImage:_twoStarButton.imageView withHeight:_twoStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  _twoStarReflectionView.frame = CGRectMake(self.twoStarButton.frame.origin.x, centerButtonTop +  starButtonHeight + 1.f, starButtonWidth, starButtonHeight);

  // Three
  self.threeStarButton.frame = CGRectMake(centerButtonLeft, centerButtonTop, starButtonWidth, starButtonHeight);

  _threeStarReflectionView.image = [UIImageView reflectedImage:_threeStarButton.imageView withHeight:_threeStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  _threeStarReflectionView.frame = CGRectMake(centerButtonLeft, centerButtonTop +  starButtonHeight + 1.f, starButtonWidth, starButtonHeight);

  // Four
  self.fourStarButton.frame = CGRectMake(centerButtonLeft + (starButtonSpacing + starButtonWidth) * 1, centerButtonTop, starButtonWidth, starButtonHeight);

  _fourStarReflectionView.image = [UIImageView reflectedImage:_fourStarButton.imageView withHeight:_fourStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  _fourStarReflectionView.frame = CGRectMake(centerButtonLeft + (starButtonSpacing + starButtonWidth) * 1, centerButtonTop +  starButtonHeight + 1.f, starButtonWidth, starButtonHeight);

  // Five
  self.fiveStarButton.frame = CGRectMake(centerButtonLeft + (starButtonSpacing + starButtonWidth) * 2, centerButtonTop, starButtonWidth, starButtonHeight);

  _fiveStarReflectionView.image = [UIImageView reflectedImage:_fiveStarButton.imageView withHeight:_fiveStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  _fiveStarReflectionView.frame = CGRectMake(centerButtonLeft + (starButtonSpacing + starButtonWidth) * 2, centerButtonTop +  starButtonHeight + 1.f, starButtonWidth, starButtonHeight);

  self.textLabel.frame = CGRectMake((self.bounds.size.width - self.textLabel.bounds.size.width) / 2, self.bounds.size.height - self.textLabel.bounds.size.height - 1.f, self.textLabel.bounds.size.width, self.textLabel.bounds.size.height);
}

#pragma mark -
#pragma mark public

- (void)clean {
  _textLabel.text = kTextLabelText;
  self.oneStarButton.selected = NO;
  self.twoStarButton.selected = NO;
  self.threeStarButton.selected = NO;
  self.fourStarButton.selected = NO;
  self.fiveStarButton.selected = NO;
  _rating = 0;
  [self reflectionViewRefresh];
}

#pragma mark -
#pragma mark private

- (void)tapStarButton:(id)object {
  if ([object isKindOfClass:[UIButton class]]) {
    UIButton *currentButton = (UIButton *)object;
    currentButton.selected = YES;

    self.textLabel.text = nil;
      
    self.rating = currentButton.tag;

    [self reflectionViewRefresh];

    [self.delegate tapDidRateView:self rating:self.rating];
  }
}

- (void)setRating:(NSInteger)aRating {
    self.oneStarButton.selected = aRating >= self.oneStarButton.tag;
    self.twoStarButton.selected = aRating >= self.twoStarButton.tag;
    self.threeStarButton.selected = aRating>= self.threeStarButton.tag;
    self.fourStarButton.selected = aRating >= self.fourStarButton.tag;
    self.fiveStarButton.selected = aRating >= self.fiveStarButton.tag;
    
    _rating = aRating;
}

- (void)reflectionViewRefresh {
  UIImageView *imageView;
  // One
  if (!self.oneStarButton.selected) {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty.png"]] autorelease];
  } else {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_full.png"]] autorelease];
  }
  _oneStarReflectionView.image = [UIImageView reflectedImage:imageView withHeight:_oneStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  
  // Two
  if (!self.twoStarButton.selected) {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty.png"]] autorelease];
  } else {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_full.png"]] autorelease];
  }
  _twoStarReflectionView.image = [UIImageView reflectedImage:imageView withHeight:_twoStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  
  // Three
  if (!self.threeStarButton.selected) {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty.png"]] autorelease];
  } else {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_full.png"]] autorelease];
  }
  _threeStarReflectionView.image = [UIImageView reflectedImage:imageView withHeight:_threeStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  
  // Four
  if (!self.fourStarButton.selected) {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty.png"]] autorelease];
  } else {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_full.png"]] autorelease];
  }
  _fourStarReflectionView.image = [UIImageView reflectedImage:imageView withHeight:self.fourStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
  
  // Five
  if (!self.fiveStarButton.selected) {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_empty.png"]] autorelease];
  } else {
    imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_full.png"]] autorelease];
  }
  _fiveStarReflectionView.image = [UIImageView reflectedImage:imageView withHeight:self.fiveStarButton.imageView.bounds.size.height * kDefaultReflectionFraction];
}

@end
