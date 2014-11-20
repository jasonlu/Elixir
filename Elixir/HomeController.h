//
//  ViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *tvWelcome;
@property (weak, nonatomic) IBOutlet UITextView *tvDisclaimer;
@property (strong, nonatomic) IBOutlet UIScrollView *svMyView;

@end

