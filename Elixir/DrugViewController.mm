//
//  DrugViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/18/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "DrugViewController.h"
#import "Dote.h"

#ifdef __cplusplus

#include "Question.h"
#include "Antidote.h"

#endif


@interface DrugViewController () {
    libAntidote::Question *question;
}

@end

@implementation DrugViewController
@synthesize lbTitle;
@synthesize counter;
@synthesize tvQuestionText;
@synthesize tbOptionTable;
@synthesize appDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Dote *dote = [Dote sharedInstance];
    //[dote setDrug:@"Acetylcysteine"];
    //NSString *ref = [dote getRef];
    
    question =  [dote getDrug]->getNextQuestion();
    
    NSString *nsRef = [NSString stringWithCString:question->getText().c_str()
                                         encoding:[NSString defaultCStringEncoding]];

    tvQuestionText.text = nsRef;
    
    //NSLog(@"ref:: %@", ref);
    // Do any additional setup after loading the view.
//    counter = 0;
    NSMutableArray *options = [[NSMutableArray alloc] init];

    for(int i = 0; i < question->getOptionsCount(); i++) {
        NSString *opt =  [NSString stringWithCString:question->getOption(i).c_str()
                                            encoding:[NSString defaultCStringEncoding]];

        [options addObject:opt];
    }
    optionArray = [[NSArray alloc] initWithArray:options];
    lbTitle.text = [NSString stringWithFormat:@"%d", counter];
    tbOptionTable.delegate = self;
    tbOptionTable.dataSource = self;
    NSLog(@"DrugVuewController viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {

    
    
    lbTitle.text = [NSString stringWithFormat:@"%d", counter];
    NSLog(@"DrugVuewController viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"DrugVuewController viewDidAppear");
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
    //lbTitle.text = [NSString stringWithFormat:@"%d", counter++];
    counter+= 10;
    // Load storyboard.
    
}

- (void)showNextQuestion {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    // Get instance of ViewController from storyboard.
    DrugViewController *add = [storyboard instantiateViewControllerWithIdentifier:@"DrugViewControllerId"];
    // Allocate AddProjectViewController
    // add = [[DrugViewController alloc] init];
    // [add loadView];
    
    // Adds the above view controller to the stack and pushes it into view
    [self.navigationController pushViewController:add animated:YES];
}



// UITableView delegate methods.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"tableView:tableView numberOfRowsInSection:section");
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
    NSLog(@"tableView:tableView cellForRowAtIndexPath:indexPath, text: %@", text);
    double tableViewHeight = [tbOptionTable contentSize].height;
    NSLog(@"tableViewHeight: %f", tableViewHeight);
    CGRect frame = tbOptionTable.frame;
    frame.size.height = tableViewHeight;
    [tbOptionTable setTranslatesAutoresizingMaskIntoConstraints:YES];
    [tbOptionTable setFrame: frame];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    NSLog(@"didSelectRowAtIndexPath: %@", indexPath);
    NSString *nsRes = [NSString stringWithFormat:@"%ld",index];
    std::string res = [nsRes UTF8String];
    question->setAnswer(res);
    [self showNextQuestion];
}


@end
