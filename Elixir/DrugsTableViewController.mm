//
//  DrugsTableViewController.m
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "DrugsTableViewController.h"
#import "Dote.h"
#import "Person.h"

@interface DrugsTableViewController () {
    UITableView *myView;
    Person *me;
}

@end

@implementation DrugsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    me = [Person sharedInstance];
    myView = (UITableView *)[self view];

    
    CGRect frame = _vTableHeader.frame;
    frame.size.height = 180;
    _vTableHeader.frame = frame;
    [myView setTableHeaderView:_vTableHeader];
    
    // Load Person data.
    _lbAge.text = [NSString stringWithFormat:@"%g yr", me.age];
    _lbHeight.text = [NSString stringWithFormat:@"%g cm", me.heightcm];
    _lbWeight.text = [NSString stringWithFormat:@"%g kg", me.weightkg];
    _lbBMI.text = [NSString stringWithFormat:@"%g kg/m^2", [me BMI]];


    drugs = [NSArray arrayWithObjects:
             @"acetylcysteine",
             
             //cyanide antidote algorithm
             @"amyl nitrite",
             @"Cyanide Antidote Kit",
             @"sodium nitrite",
             @"sodium thiosulfate",
             @"hydroxocobalamin",
             @"Cyanokit",
             //cyanide antidote algorithm
             
             //Rattlesnake
             @"crotalidae antivenin (ovine) CroFab"
             @"Rattlesnake",
             //Rattlesnake
             
             @"Black Widow antivenin",
             @"Coral Snake antivenin",
             @"atropine (for insecticide exposure)",
             @"Botulism Antitoxin (non-infant)",
             @"Baby BIG",
             
             //CaCl
             @"CaCl",
             @"calcium chloride",
             @"calcium gluconate",
             @"calcium salts",
             //CaCl
             
             
             //Ca-EDTA&Dimercaprol
             @"Ca-EDTA & dimercaprol",
             @"dimercaprol (Pb toxicity)",
             //Ca-EDTA&Dimercaprol
             
             
             @"Ca-DTA/Zn-DTPA",
             @"deferoxamine",
             @"Digoxin Immune FAB",
             @"dimercaprol (As, Au, or Hg toxicity)",
             @"ethanol",
             @"flumazenil",
             @"fomepizole",
             @"glucagon",
             @"methylene blue",
             @"naloxone",
             @"octreotide",
             @"physostigmine",
             @"potassium iodide",
             @"pralidoxime",
             @"prussian blue",
             @"pyridoxine",
             @"Vitamin B-6",
             @"sodium bicarbonate", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"subviews: %@", [_vTableHeader subviews]);
    CGRect frame;
    CGRect lastFrame = [[[_vTableHeader subviews] lastObject] frame];
    

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
    NSString *text = [drugs objectAtIndex:indexPath.row];
    cell.textLabel.text = text;//[NSString stringWithFormat:];
    //NSLog(@"tableView:tableView cellForRowAtIndexPath:indexPath, text: %@", text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *drugName = (NSString *)[drugs objectAtIndex:indexPath.row];
    Dote *dote = [Dote sharedInstance];
    [dote setDrug:drugName];
    //NSLog(@"didSelectRowAtIndexPath: %@", indexPath);
    //NSLog(@"didSelectRowAtIndexPath: %@", drugName);
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
