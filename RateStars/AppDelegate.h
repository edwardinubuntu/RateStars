//
//  AppDelegate.h
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DemoViewController *viewController;
@property (nonatomic, retain) UINavigationController *navigationController;

@end
