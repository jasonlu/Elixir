//
//  Person.h
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {

}

@property double age;
@property double heightcm;
@property double weightkg;

+(Person *) sharedInstance;
-(void) setParamsAge:(double)newAge Height:(double)height weight:(double)weight;
-(double) BMI;
-(double) BSA;
@end
