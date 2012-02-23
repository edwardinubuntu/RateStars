//
//  ViewController.m
//  RateStars
//
//  Created by Edward Chiang on 12/2/23.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

@synthesize tapRateView = _tapRateView;

- (void)loadView {
  [super loadView];
  self.title = @"Submit Review";
  _tapRateView = [[RSTapRateView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, 50.f)];
  _tapRateView.delegate = self;
  [self.view addSubview:_tapRateView];

  UIBarButtonItem *sendButton = [[[UIBarButtonItem alloc] initWithTitle:@"Send" style:UIBarButtonItemStyleDone target:self action:@selector(send:)] autorelease];
  self.navigationItem.rightBarButtonItem = sendButton;

  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  [_tapRateView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark RSTapRateViewDelegate

- (void)tapDidRateView:(RSTapRateView*)view rating:(NSInteger)rating {
  NSLog(@"Current rating: %i", rating);
}

#pragma mark -
#pragma mark private

- (void)send:(id)object {
  UIAlertView *alertResult = [[UIAlertView alloc] initWithTitle:@"Thanks" message:[NSString stringWithFormat:@"You gave it %i-Stars rating!", self.tapRateView.rating] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
  [alertResult show];
  [alertResult release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  [self.tapRateView refresh];
}

@end
