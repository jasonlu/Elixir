//
//  Dote.m
//  Elixir
//
//  Created by Jason Lu on 11/19/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "Dote.h"


struct CPPMembers {
    libAntidote::Antidote *antidote;
};

@interface Dote()

@property (nonatomic) libAntidote::Antidote *dote;


@end


@implementation Dote
@synthesize dote;
@synthesize cppMembers;

static Dote *me = nil;
+ (Dote *) sharedInstance {
    if( me == nil) {
        me = [[Dote alloc] init];
    }
    return me;
}


- (instancetype)init {
    self = [super init];
    dote = new libAntidote::Acetylcysteine(20, 180, 80);
    //NSLog(@"ref: %@", nsRef);
    return self;
}


- (instancetype)initWithDrug: (NSString *) drugName {
    self = [self init];
    
    if (self) {
        [self setDrug:drugName];
    }
    
    //dote = new libAntidote::Acetylcysteine(20, 180, 80);
    //NSLog(@"ref: %@", nsRef);
    return self;
}



- (NSString *)getRef {
    std::string ref = dote->getRef();
    
    NSString *nsRef = [NSString stringWithCString:ref.c_str()
                                         encoding:[NSString defaultCStringEncoding]];
    return nsRef;
}





- (void)setDrug: (NSString *)drugName {
    if([drugName isEqualToString: @"Acetylcysteine"]) {
        dote = new libAntidote::Acetylcysteine(20, 180, 80);
    } else {
        dote = new libAntidote::Acetylcysteine(20, 180, 80);
    }
}


- (libAntidote::Antidote *)getDrug {
    return dote;
}
@end
