//
//  DrugsTableViewController.h
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AlgorithmTableViewController : UITableViewController {
    NSArray *drugs;
}
@property (weak, nonatomic) IBOutlet UIView *vTableHeader;
@property (weak, nonatomic) IBOutlet UILabel *lbAge;
@property (weak, nonatomic) IBOutlet UILabel *lbHeight;
@property (weak, nonatomic) IBOutlet UILabel *lbWeight;
@property (weak, nonatomic) IBOutlet UILabel *lbBSA;
@property (weak, nonatomic) IBOutlet UILabel *lbBMI;

@end
