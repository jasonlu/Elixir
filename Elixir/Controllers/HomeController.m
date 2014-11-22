//
//  ViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

@synthesize tvWelcome;
@synthesize tvDisclaimer;
@synthesize svMyView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [tvWelcome sizeToFit];
    [tvDisclaimer sizeToFit];

    NSLog(@"view loaded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
