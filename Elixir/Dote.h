//
//  Dote.h
//  Elixir
//
//  Created by Jason Lu on 11/19/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#include "Acetylcysteine.h"
#include "Atropine.h"

#endif



//Forward declare struct
struct CPPMembers;

@interface Dote : NSObject {
    //opaque pointer to store cpp members
    //struct CPPMembers *cppMembers;
}

@property (nonatomic) struct CPPMembers *cppMembers;

+ (Dote *) sharedInstance;
- (NSString *)getRef;

- (libAntidote::Antidote *)getDrug;
- (void)setDrug: (NSString *)drugName;
    
    
@end
