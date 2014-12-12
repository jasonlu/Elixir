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

@interface AlgorithmTableViewController () {
    UITableView *myView;
    Person *me;
}

@end

@implementation AlgorithmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myView = (UITableView *)[self view];
    _vTableHeader = [[[NSBundle mainBundle] loadNibNamed:@"DrugsTableHeader" owner:self options:nil] objectAtIndex:0];
    
    CGRect frame = _vTableHeader.frame;
    frame.size.height = 180;
    _vTableHeader.frame = frame;
    [myView setTableHeaderView:_vTableHeader];
    
    NSLog(@"restorationIdentifier: %@", self.navigationController.restorationIdentifier);
    NSString* plistPath;
    
    if([self.navigationController.restorationIdentifier isEqualToString:@"ToxinModeView"]) {
        // Toxin mode
        self.navigationItem.title = @"Select Toxin";
        plistPath = [[NSBundle mainBundle] pathForResource:@"toxins" ofType:@"plist"];
    } else {
        self.navigationItem.title = @"Select Drug";
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

#pragma mark - Table view data source

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
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
