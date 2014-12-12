//
//  Dote.m
//  Elixir
//
//  Created by Jason Lu on 11/19/14.
//  Copyright (c) 2014 jasonl.biz. All rights reserved.
//

#import "Dote.h"
#import "Person.h"

struct CPPMembers {
    libAntidote::Antidote *antidote;
};

@interface Dote()

@property (nonatomic) libAntidote::Antidote *dote;


@end


@implementation Dote
@synthesize dote;
@synthesize name;

static Dote *me = nil;
+ (Dote *) sharedInstance {
    if( me == nil) {
        me = [[Dote alloc] init];
    }
    return me;
}


- (instancetype)init {
    self = [super init];
    [self setDrug:@"Acetylcysteine"];
    //dote = new libAntidote::Acetylcysteine(20, 180, 80);
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
    
    name = drugName;
    Person *me = [Person sharedInstance];
    double age, height, weight;
    age = me.age;
    height = me.heightcm;
    weight = me.weightkg;
    
    //acetylcysteine algorithm
    if ([drugName isEqualToString: @"Acetylcysteine"]) {
        dote = new libAntidote::Acetylcysteine(age, height, weight);
    }
    //cyanide antidote algorithm
    else if ([drugName isEqualToString: @"CyanideToxicity"]) {
        dote = new libAntidote::CyanideToxicity(age, height, weight);
    }
    //Rattlesnake algorithm
    else if ([drugName isEqualToString: @"CrotalidaeOvine"])
    {
        dote = new libAntidote::CrotalidaeOvine(age, height, weight);
    }
    //Black Widow antivenin algorithm
    else if ([drugName isEqualToString: @"BlackWidow"])
    {
        dote = new libAntidote::BlackWidow(age, height, weight);
    }
    //Coral Snake antivenin algorithm
    else if ([drugName isEqualToString: @"CoralSnake"])
    {
        dote = new libAntidote::CoralSnake(age, height, weight);
    }
    //Atropine for organophosphorus and n-methyl carbamate instecticides
    else if ([drugName isEqualToString: @"Atropine"])
    {
        dote = new libAntidote::Atropine(age, height, weight);
    }
    //Botulism Antitoxin (non-infant)
    else if ([drugName isEqualToString: @"BATbotulism"])
    {
        dote = new libAntidote::BATbotulism(age, height, weight);
    }
    //Baby BIG
    else if ([drugName isEqualToString: @"BabyBIG"])
    {
        dote = new libAntidote::BabyBIG(age, height, weight);
    }
    //CaCl
    else if ([drugName isEqualToString: @"CaChloride"])
    {
        dote = new libAntidote::CaChloride(age, height, weight);
    }
    //Ca-EDTA&Dimercaprol
    else if ([drugName isEqualToString: @"EdtaDimercaprol"])
    {
        //dote = new libAntidote::EdtaDimercaprol(age, height, weight);
    }
    //Ca-DTA/Zn-DTPA
    else if ([drugName isEqualToString: @"CaDTPA"])
    {
        dote = new libAntidote::CaDTPA(age, height, weight);
    }
    //deferoxamine
    else if ([drugName isEqualToString: @"Deferoxamine"])
    {
        dote = new libAntidote::Deferoxamine(age, height, weight);
    }
    //Digoxin Immune FAB
    else if ([drugName isEqualToString: @"DigiFab"])
    {
        dote = new libAntidote::DigiFab(age, height, weight);
    }
    //Dimercaprol for heavy metal
    else if ([drugName isEqualToString: @"Dimercap"])
    {
        dote = new libAntidote::Dimercap(age, height, weight);
    }
    //Ethanol for methanol and ethylene glycol
    else if ([drugName isEqualToString: @"Etoh"])
    {
        dote = new libAntidote::Etoh(age, height, weight);
    }
    //Flumazenil
    else if ([drugName isEqualToString: @"Flumazenil"])
    {
        dote = new libAntidote::Flumazenil(age, height, weight);
    }
    //Fomepizole
    else if ([drugName isEqualToString: @"Fomepizole"])
    {
        dote = new libAntidote::Fomepizole(age, height, weight);
    }
    //Glucagon
    else if ([drugName isEqualToString: @"Glucagon"])
    {
        dote = new libAntidote::Glucagon(age, height, weight);
    }
    //Methylene blue
    else if ([drugName isEqualToString: @"MetBlue"])
    {
        dote = new libAntidote::MetBlue(age, height, weight);
    }
    //Naloxone
    else if ([drugName isEqualToString: @"Naloxone"])
    {
        dote = new libAntidote::Naloxone(age, height, weight);
    }
    //Octreotide
    else if ([drugName isEqualToString: @"Octreotide"])
    {
        dote = new libAntidote::Octreotide(age, height, weight);
    }
    //Physostigmine
    else if ([drugName isEqualToString: @"Physostigmine"])
    {
        dote = new libAntidote::Physostigmine(age, height, weight);
    }
    //Potassium Iodide
    else if ([drugName isEqualToString: @"PotassiumIodide"])
    {
        dote = new libAntidote::PotassiumIodide(age, height, weight);
    }
    //Pralidoxime
    else if ([drugName isEqualToString: @"Pralidoxime"])
    {
        dote = new libAntidote::Pralidoxime(age, height, weight);
    }
    //Prussian Blue
    else if ([drugName isEqualToString: @"PrussianBlue"])
    {
        dote = new libAntidote::PrussianBlue(age, height, weight);
    }
    //Pyridoxine vitamin B-6
    else if ([drugName isEqualToString: @"Pyridoxine"])
    {
        dote = new libAntidote::Pyridoxine(age, height, weight);
    }
    //Sodium Bicarbonate
    else if ([drugName isEqualToString: @"SodiumBicarbonate"])
    {
        dote = new libAntidote::SodiumBicarbonate(age, height, weight);
    }
}


- (libAntidote::Antidote *)getDrug {
    return dote;
}
@end
