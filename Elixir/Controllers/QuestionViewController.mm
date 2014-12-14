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
    Dote *dote;
}

@end

@implementation QuestionViewController
@synthesize btnNext;
@synthesize counter;
@synthesize tvQuestionText;
@synthesize tbOptionTable;
@synthesize vInputView;
@synthesize vResponseView;
@synthesize tfInputvalue;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadQuestion];
}

- (void)loadQuestion {
    dote = [Dote sharedInstance];
    if(dote == nil) {
        // dote cannot be null.
        return;
    }
    
    question =  [dote getDrug]->getNextQuestion();
    // Set title
    [_lbTitle setText: [dote name]];
    
    // Set question text
    NSString *nsQuestionText = [NSString stringWithCString:question->getText().c_str()
                                                  encoding:[NSString defaultCStringEncoding]];
    
    [_lbQuestionText setText:nsQuestionText];
    [_lbQuestionText sizeToFit];
    
    // Set reference text
    NSString *nsRef = [NSString stringWithCString:[dote getDrug]->getRef().c_str()
                                         encoding:[NSString defaultCStringEncoding]];
    [_lbRef setText:nsRef];


    // Load options
    NSMutableArray *options = [[NSMutableArray alloc] init];
    for(int i = 0; i < question->getOptionsCount(); i++) {
        NSString *opt =  [NSString stringWithCString:question->getOption(i).c_str()
                                            encoding:[NSString defaultCStringEncoding]];
        [options addObject:opt];
    }
    optionArray = [[NSArray alloc] initWithArray:options];

    // Set option table
    tbOptionTable.delegate = self;
    tbOptionTable.dataSource = self;
    
    // Initialize views by question type.
    std::string type = question->getType();
    if(type == "numbers") {
        std::string unitType = question->getUnitType();
        NSString *nsUnitType = [NSString stringWithCString: unitType.c_str() encoding:[NSString defaultCStringEncoding]];
        [_lbUnitType setText:nsUnitType];
        [_lbUnitType sizeToFit];
        
        double ansValue = question->getAnswerFloat();
        if(ansValue == -1) {
            tfInputvalue.text = @"";
        } else {
            tfInputvalue.text = [NSString stringWithFormat:@"%g", ansValue];
        }
        
        [tfInputvalue becomeFirstResponder];
        [btnNext setEnabled:NO];
        
        // Handle swipe.
        _gLeftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
        _gLeftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [[self view] addGestureRecognizer:_gLeftSwipe];
    }
    

        
    if(type == "end") {
        [btnNext setTitle:@"Finish" forState: UIControlStateNormal];
        [_tvRef sizeToFit];
        [_vRefView sizeToFit];
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


- (IBAction)btnNextClicked:(UIButton *)sender {
    if(tfInputvalue == nil) {
        question->setAnswer("1");
        [self showNextQuestion];
        return;
    }
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

    if(question->getType() != "end") {
        NSString *nibName = @"";
        QuestionViewController* questionViewController;
        std::string type = [dote getDrug]->getNextQuestion()->getType();
        if(type == "numbers") {
            nibName = @"QuestionWithInput";
        } else if(type == "options" || type == "yesno") {
            nibName = @"QuestionWithOptions";
        } else if(type == "warning" || type == "info") {
            nibName = @"QuestionWithOk";
        } else if(type == "end") {
            nibName = @"QuestionWithRef";
        }
        questionViewController = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
        [[self navigationController] pushViewController:questionViewController animated:YES];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}



// UITableView delegate methods.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    [tbOptionTable setTranslatesAutoresizingMaskIntoConstraints: YES];
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
