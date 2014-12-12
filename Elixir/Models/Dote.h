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
#include "Antidote.h"
#include "Atropine.h"
#include "BATbotulism.h"
#include "BabyBIG.h"
#include "BlackWidow.h"
#include "CaChloride.h"
#include "CaDTPA.h"
#include "CoralSnake.h"
#include "CrotalidaeOvine.h"
#include "CyanideToxicity.h"
#include "Deferoxamine.h"
#include "DigiFab.h"
#include "Dimercap.h"
#include "EdtaDimercaprol.h"
#include "Etoh.h"
#include "Flumazenil.h"
#include "Fomepizole.h"
#include "Glucagon.h"
#include "MetBlue.h"
#include "Naloxone.h"
#include "Octreotide.h"
#include "Physostigmine.h"
#include "PotassiumIodide.h"
#include "Pralidoxime.h"
#include "PrussianBlue.h"
#include "Pyridoxine.h"
#include "SodiumBicarbonate.h"



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
