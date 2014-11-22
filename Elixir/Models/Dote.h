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
#include "BabyBIG.h"
#include "BATbotulism.h"
#include "BlackWidow.h"
#include "CaChloride.h"
#include "CaDTPA.h"
#include "CoralSnake.h"
#include "CrotalidaeOvine.h"
#include "CyanideToxicity.h"
#include "Deferoxamine.h"
#include "DigiFab.h"



#endif


@interface Dote : NSObject {
    //opaque pointer to store cpp members
    //struct CPPMembers *cppMembers;
}

@property (nonatomic, readonly) NSString *name;

+ (Dote *) sharedInstance;
- (NSString *)getRef;

- (libAntidote::Antidote *)getDrug;
- (void)setDrug: (NSString *)drugName;
    
    
@end
