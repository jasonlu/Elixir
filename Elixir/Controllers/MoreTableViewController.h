//
//  MiscTableViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/21/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *tvcCallPCC;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segUnitType;
- (IBAction)setUnitType:(id)sender;

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;

@end
