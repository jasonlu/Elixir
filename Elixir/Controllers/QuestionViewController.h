//
//  DrugViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface QuestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *optionArray;
}

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbQuestionText;
@property (weak, nonatomic) IBOutlet UILabel *lbRef;
@property (weak, nonatomic) IBOutlet UILabel *lbUnitType;

// Text views
@property (weak, nonatomic) IBOutlet UITextView *tvQuestionText;
@property (weak, nonatomic) IBOutlet UITextView *tvRef;



// Buttons
@property (weak, nonatomic) IBOutlet UIButton *btnNext;


@property (weak, nonatomic) IBOutlet UITableView *tbOptionTable;
@property (weak, nonatomic) IBOutlet UITextField *tfInputvalue;


@property (nonatomic, assign) int counter;


@property (weak, nonatomic) IBOutlet UIView *vInputView;

@property (weak, nonatomic) IBOutlet UIView *vResponseView;
@property (weak, nonatomic) IBOutlet UIView *vRefView;
@property (strong, nonatomic) UISwipeGestureRecognizer *gLeftSwipe;


- (IBAction)btnNextClicked:(UIButton *)sender;
- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender;
- (IBAction)tfEditingChanged:(UITextField *)sender;

@end
