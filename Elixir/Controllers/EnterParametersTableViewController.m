//
//  EnterParametersTableViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "EnterParametersTableViewController.h"
#import "Person.h"

@interface EnterParametersTableViewController () {
    Person *me;
}

@end

@implementation EnterParametersTableViewController
@synthesize vcNextViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    me = [Person sharedInstance];
    if(me.age == 0 || me.heightcm == 0 || me.weightkg == 0) {
        [_btnNext setEnabled:NO];
    } else {
        [_btnNext setEnabled:YES];
    }
    _tfAge.text = [NSString stringWithFormat:@"%g", me.age];
    _tfHeight.text = [NSString stringWithFormat:@"%g", me.heightcm];
    _tfWeight.text = [NSString stringWithFormat:@"%g", me.weightkg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savePerson:(UIBarButtonItem *)sender {
    me.age = [_tfAge.text doubleValue];
    me.heightcm = [_tfHeight.text doubleValue];
    me.weightkg = [_tfWeight.text doubleValue];
    [[NSUserDefaults standardUserDefaults] setDouble:me.age forKey:@"PersonAge"];
    [[NSUserDefaults standardUserDefaults] setDouble:me.heightcm forKey:@"PersonHeightCm"];
    [[NSUserDefaults standardUserDefaults] setDouble:me.weightkg forKey:@"PersonWeightKg"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if(vcNextViewController == nil) {
        [[self navigationController] dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[self navigationController] pushViewController:vcNextViewController animated:YES];
    }
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    me.age = [_tfAge.text doubleValue];
    me.heightcm = [_tfHeight.text doubleValue];
    me.weightkg = [_tfWeight.text doubleValue];
}


- (IBAction)tfEditingChanged:(UITextField *)sender {
    if([[_tfAge text] doubleValue] == 0 || [[_tfHeight text] doubleValue] == 0 || [[_tfWeight text] doubleValue] == 0) {
        [_btnNext setEnabled:NO];
        
    } else {
        [_btnNext setEnabled:YES];
    }
}
@end
