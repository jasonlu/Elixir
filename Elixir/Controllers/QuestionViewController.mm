//
//  DrugViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "QuestionViewController.h"
#import "AlgorithmTableViewController.h"
#import "Dote.h"

#ifdef __cplusplus

#include "Question.h"
#include "Antidote.h"

#endif


@interface QuestionViewController () {
    libAntidote::Question *question;
}

@end

@implementation QuestionViewController
@synthesize btnNext;
@synthesize lbTitle;
@synthesize counter;
@synthesize tvQuestionText;
@synthesize tbOptionTable;
@synthesize appDelegate;
@synthesize vInputView;
@synthesize vResponseView;
@synthesize tfInputvalue;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Dote *dote = [Dote sharedInstance];
    if(dote == nil) {
        return;
    }
    //[dote setDrug:@"Acetylcysteine"];
    //NSString *ref = [dote getRef];
    
    question =  [dote getDrug]->getNextQuestion();
    
    NSString *nsQuestionText = [NSString stringWithCString:question->getText().c_str()
                                         encoding:[NSString defaultCStringEncoding]];

    
    NSString *nsRef = [NSString stringWithCString:[dote getDrug]->getRef().c_str()
                                                  encoding:[NSString defaultCStringEncoding]];

    tvQuestionText.text = nsQuestionText;
    
    NSMutableArray *options = [[NSMutableArray alloc] init];

    for(int i = 0; i < question->getOptionsCount(); i++) {
        NSString *opt =  [NSString stringWithCString:question->getOption(i).c_str()
                                            encoding:[NSString defaultCStringEncoding]];

        [options addObject:opt];
    }
    optionArray = [[NSArray alloc] initWithArray:options];
    lbTitle.text = [dote name];
    tbOptionTable.delegate = self;
    tbOptionTable.dataSource = self;
    std::string type = question->getType();
    //NSLog(@"type:: %@", [NSString stringWithCString:type.c_str() encoding: [NSString defaultCStringEncoding]]);
    
    if(type == "numbers") {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        std::string unitType = question->getUnitType();
        label.text = [NSString stringWithCString: unitType.c_str() encoding:[NSString defaultCStringEncoding]];
        label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        [label sizeToFit];
        tfInputvalue.rightViewMode = UITextFieldViewModeAlways;
        tfInputvalue.rightView = label;
        double ansValue = question->getAnswerFloat();
        if(ansValue == -1) {
            tfInputvalue.text = @"";
        } else {
            tfInputvalue.text = [NSString stringWithFormat:@"%g", ansValue];
        }
        
        [vResponseView setHidden:YES];
        [tbOptionTable setHidden:YES];
        [tfInputvalue becomeFirstResponder];
        [btnNext setEnabled:NO];
        
        // Handle swipe.
        _gLeftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
        _gLeftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [[self view] addGestureRecognizer:_gLeftSwipe];
        
    } else if(type == "options" || type == "yesno") {
        [vResponseView setHidden:YES];
        [vInputView setHidden:YES];
    } else if(type == "end" || type == "warning" || type == "info") {
        [tbOptionTable setHidden:YES];
        [vInputView setHidden:YES];
    }
    if(type == "end") {
        btnNext.titleLabel.text = @"Finish";
    }
}

- (void)viewWillAppear:(BOOL)animated {
    //NSLog(@"DrugVuewController viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    //NSLog(@"DrugVuewController viewDidAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnNextClicked:(UIButton *)sender {
    NSString *stringValue = [tfInputvalue text];
    double value = [stringValue doubleValue];
    if( value < question->getMin() || value > question->getMax() ) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Value our of range"
                                                          message:@"The value you inputed is out of range, please try again."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        return;
    } else {
        std::string res = [stringValue UTF8String];
        question->setAnswer(res);
        [self showNextQuestion];
    }
}

- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    [self btnNextClicked:nil];
    NSLog(@"swipe left");
}

- (IBAction)tfEditingChanged:(UITextField *)sender {
    if([[sender text] isEqualToString: @""]) {
        [btnNext setEnabled:NO];
    } else {
        [btnNext setEnabled:YES];
    }
}

- (void)showNextQuestion {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    if(question->getType() != "end") {
        // if(question->hasMoreOptions()) {
        // Get instance of ViewController from storyboard.
        QuestionViewController *add = [storyboard instantiateViewControllerWithIdentifier:@"QuestionViewControllerId"];
        // Allocate AddProjectViewController
        // add = [[DrugViewController alloc] init];
        // [add loadView];
        // Adds the above view controller to the stack and pushes it into view
        [self.navigationController pushViewController:add animated:YES];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}



// UITableView delegate methods.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSLog(@"numberOfSectionsInTableView");
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"tableView:tableView numberOfRowsInSection:section");
    // Return the number of rows in the section.
    return [optionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSString *text = [optionArray objectAtIndex:indexPath.row];
    cell.textLabel.text = text;//[NSString stringWithFormat:];
    double tableViewHeight = [tbOptionTable contentSize].height;
    CGRect frame = tbOptionTable.frame;
    frame.size.height =  tableViewHeight;
    [tbOptionTable setFrame: frame];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    //NSLog(@"didSelectRowAtIndexPath: %@", indexPath);
    NSString *nsRes = [NSString stringWithFormat:@"%ld",index];
    std::string res = [nsRes UTF8String];
    question->setAnswer(res);
    [self showNextQuestion];
}



@end
