//
//  Person.m
//  Elixir
//
//  Created by Jason Lu on 11/20/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize age;
@synthesize heightcm;
@synthesize weightkg;

static Person *instance = nil;
+(Person *) sharedInstance {
    if(instance == nil) {
        instance = [[Person alloc] init];
    }
    [instance load];
    return instance;
}

-(instancetype)init {
    self = [super init];
    age = 0;
    heightcm = 0;
    weightkg = 0;
    return self;
}

-(void) setParamsAge:(double)newAge Height:(double)height weight:(double)weight {
    [self setAge: newAge];
    heightcm = height;
    weightkg = weight;
    
}

-(void) load {
    double newAge, height, weight;
    newAge = [[NSUserDefaults standardUserDefaults] doubleForKey:@"PersonAge"];
    height = [[NSUserDefaults standardUserDefaults] doubleForKey:@"PersonHeightCm"];
    weight = [[NSUserDefaults standardUserDefaults] doubleForKey:@"PersonWeightKg"];
    [instance setParamsAge:newAge Height:height weight:weight];
}

-(double) BMI {
    return weightkg / (heightcm * heightcm * 0.0001);
}

-(double) BSA {
    return 0.007184 * pow(weightkg, 0.425) * pow(heightcm, 0.725);
}
-(NSString *) description {
    return [NSString stringWithFormat:@"age: %f, heightcm: %f, wieghtkg: %f", age, heightcm, weightkg  ];
}

@end
