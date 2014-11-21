//
//  EnterParametersTableViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterParametersTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *lbAge;
@property (weak, nonatomic) IBOutlet UILabel *lbHeight;
@property (weak, nonatomic) IBOutlet UILabel *lbWeight;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UITextField *tfHeight;
@property (weak, nonatomic) IBOutlet UITextField *tfWeight;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnNext;
- (IBAction)tfEditingChanged:(UITextField *)sender;

@end
