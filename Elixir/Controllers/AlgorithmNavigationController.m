//
//  DrugModeViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/21/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "AlgorithmNavigationController.h"
#import "EnterParametersTableViewController.h"
#import "Person.h"

@interface AlgorithmNavigationController () {
    Person *me;
}

@end

@implementation AlgorithmNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    
}

-(void)viewWillAppear:(BOOL)animated {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    me = [Person sharedInstance];
    NSString *paramControllerId = @"EnterParametersTableViewControllerId";
    NSString *drugTableControllerId = @"AlgorithmTableViewControllerId";
    
    // Possible root views.
    EnterParametersTableViewController *vcParamsView = [storyboard instantiateViewControllerWithIdentifier:paramControllerId];
    UIViewController *vcDrugTable = [storyboard instantiateViewControllerWithIdentifier:drugTableControllerId];
    [vcParamsView setVcNextViewController:vcDrugTable];
    
    // ViewController stack
    NSArray *viewControllers;
    
    if(me.age == 0 || me.heightcm == 0 || me.weightkg == 0) {
        viewControllers = [NSArray arrayWithObjects:vcParamsView, nil];
    } else {
        viewControllers = [NSArray arrayWithObjects:vcDrugTable, nil];
    }
    [self setViewControllers: viewControllers];
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

@end
