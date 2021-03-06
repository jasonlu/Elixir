//
//  DrugsTableViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "AlgorithmTableViewController.h"
#import "Dote.h"
#import "Person.h"
#import "QuestionViewController.h"
#import "EnterParametersTableViewController.h"

@interface AlgorithmTableViewController () {
    UITableView *myView;
    Person *me;
}

@end

@implementation AlgorithmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myView = (UITableView *)[self view];
    
    // Load table header.
    _vTableHeader = [[[NSBundle mainBundle] loadNibNamed:@"AlgorithmTableHeader" owner:self options:nil] objectAtIndex:0];
    [_vTableHeader sizeToFit];
    CGRect frame = _vTableHeader.frame;
    frame.size.height = 200;
    _vTableHeader.frame = frame;
    // [_vTableHeader.layer setBorderColor:[UIColor blackColor].CGColor];
    // [_vTableHeader.layer setBorderWidth:5.0];
    [myView setTableHeaderView: _vTableHeader];
  

    

    NSString* plistPath;
    if([self.navigationController.restorationIdentifier isEqualToString:@"ToxinModeView"]) {
        // Toxin mode
        self.navigationItem.title = @"Select Toxin";
        plistPath = [[NSBundle mainBundle] pathForResource:@"toxins" ofType:@"plist"];
    } else {
        self.navigationItem.title = @"Select Antidote";
        plistPath = [[NSBundle mainBundle] pathForResource:@"drugs" ofType:@"plist"];
        
    }
    
    drugs = [NSArray arrayWithContentsOfFile: plistPath];
    id mySort = ^(NSDictionary * obj1, NSDictionary * obj2){
        NSString *name1 = [[obj1 objectForKey:@"Name"] lowercaseString];
        NSString *name2 = [[obj2 objectForKey:@"Name"] lowercaseString];
        return [name1 compare: name2];
    };
    drugs = [drugs sortedArrayUsingComparator:mySort];
    
}

-(void)viewWillAppear:(BOOL)animated {
    me = [Person sharedInstance];
    NSLog(@"viewWillAppear");
    // Load Person data.
    _lbAge.text = [NSString stringWithFormat:@"%g yr", me.age];
    _lbHeight.text = [NSString stringWithFormat:@"%g cm", me.heightcm];
    _lbWeight.text = [NSString stringWithFormat:@"%g kg", me.weightkg];
    _lbBMI.text = [NSString stringWithFormat:@"%g kg/m^2", [me BMI]];
    _lbBSA.text = [NSString stringWithFormat:@"%g m^2", [me BSA]];


    //NSLog(@"subviews: %@", [_vTableHeader subviews]);
    //CGRect frame;
    //CGRect lastFrame = [[[_vTableHeader subviews] lastObject] frame];
    

}

-(void)viewDidAppear:(BOOL)animated {
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [drugs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // Configure the cell...
    NSDictionary *drug = [drugs objectAtIndex:indexPath.row];
    NSString *text = [drug objectForKey:@"Name"];
    cell.textLabel.text = text;//[NSString stringWithFormat:];
    //NSLog(@"tableView:tableView cellForRowAtIndexPath:indexPath, text: %@", text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *drug = [drugs objectAtIndex:indexPath.row];
    Dote *dote = [Dote sharedInstance];
    [dote setDrug: [drug objectForKey:@"Algorithm"]];
    
    // This works completely. All outlets works.
    //    QuestionViewController* questionViewController = [[QuestionViewController alloc] init];
    NSString *nibName = @"";
    std::string type = [dote getDrug]->getNextQuestion()->getType();
    NSLog(@"type: %s", type.c_str());
    if(type == "numbers") {
        nibName = @"QuestionWithInput";
    } else if(type == "options" || type == "yesno") {
        nibName = @"QuestionWithOptions";
    } else if(type == "warning" || type == "info") {
        nibName = @"QuestionWithOk";
    } else if(type == "end") {
        nibName = @"QuestionWithRef";
    }
    QuestionViewController* questionViewController = [[[NSBundle mainBundle] loadNibNamed: nibName owner:nil options:nil] objectAtIndex:0];
    [[self navigationController] pushViewController:questionViewController animated:YES];
}


- (IBAction)btnEditClicked:(UIButton *)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    NSLog(@"edit clicked");

    NSString *paramControllerId = @"EnterParametersTableViewControllerId";
    NSString *drugTableControllerId = @"AlgorithmTableViewControllerId";
    
    EnterParametersTableViewController *vcParamsView = [storyboard instantiateViewControllerWithIdentifier:paramControllerId];
    UIViewController *vcDrugTable = [storyboard instantiateViewControllerWithIdentifier:drugTableControllerId];
    [vcParamsView setVcNextViewController:vcDrugTable];

    [[self navigationController] pushViewController:vcParamsView animated:YES];
}
@end
