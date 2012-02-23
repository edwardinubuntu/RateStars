//
//  ViewController.h
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSTapRateView.h"

@interface DemoViewController : UIViewController <RSTapRateViewDelegate>

@property (nonatomic, retain) RSTapRateView *tapRateView;

@end
