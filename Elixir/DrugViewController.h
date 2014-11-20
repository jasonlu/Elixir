//
//  DrugViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class AppDelegate;
#import "AppDelegate.h"


@interface DrugViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *optionArray;
}

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UITextView *tvQuestionText;
@property (weak, nonatomic) IBOutlet UITableView *tbOptionTable;
@property (nonatomic, assign) int counter;
@property (nonatomic) AppDelegate *appDelegate;


- (IBAction)btnNextClicked:(UIButton *)sender;

@end
