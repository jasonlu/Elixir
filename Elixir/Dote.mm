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
    if ([drugName isEqualToString: @"acetylcysteine"]) {
        dote = new libAntidote::Acetylcysteine(age, height, weight);
    }
    //cyanide antidote algorithm
    else if ([drugName isEqualToString: @"amyl nitrite"]||[drugName isEqualToString: @"Cyanide Antidote Kit"]||
             [drugName isEqualToString: @"sodium nitrite"]||[drugName isEqualToString: @"sodium thiosulfate"]||
             [drugName isEqualToString: @"hydroxocobalamin"]||[drugName isEqualToString: @"Cyanokit"]) {
        dote = new libAntidote::CyanideToxicity(age, height, weight);
    }
    //Rattlesnake algorithm
    else if ([drugName isEqualToString: @"crotalidae antivenin (ovine) CroFab"] ||
             [drugName isEqualToString: @"Rattlesnake"])
    {
        dote = new libAntidote::CrotalidaeOvine(age, height, weight);
    }
    //Black Widow antivenin algorithm
    else if ([drugName isEqualToString: @"Black Widow antivenin"]||[drugName isEqualToString: @"Latrodectus mactans antivenin"])
    {
        dote = new libAntidote::BlackWidow(age, height, weight);
    }
    //Coral Snake antivenin algorithm
    else if ([drugName isEqualToString: @"Coral Snake antivenin"]||[drugName isEqualToString: @"Micrurus fulvius antivenin"])
    {
        dote = new libAntidote::CoralSnake(age, height, weight);
    }
    //Atropine for organophosphorus and n-methyl carbamate instecticides
    else if ([drugName isEqualToString: @"atropine (for insecticide exposure)"])
    {
        dote = new libAntidote::Atropine(age, height, weight);
    }
    //Botulism Antitoxin (non-infant)
    else if ([drugName isEqualToString: @"Botulism Antitoxin (non-infant)"])
    {
        dote = new libAntidote::BATbotulism(age, height, weight);
    }
    //Baby BIG
    else if ([drugName isEqualToString: @"Baby BIG"])
    {
        dote = new libAntidote::BabyBIG(age, height, weight);
    }
    //CaCl
    else if ([drugName isEqualToString: @"calcium chloride"]||
             [drugName isEqualToString: @"calcium gluconate"]||
             [drugName isEqualToString: @"calcium salts"]||
             [drugName isEqualToString: @"CaCl"])
    {
        dote = new libAntidote::CaChloride(age, height, weight);
    }
    //Ca-EDTA&Dimercaprol
    else if ([drugName isEqualToString: @"Ca-EDTA & dimercaprol"]||[drugName isEqualToString: @"dimercaprol (Pb toxicity)"])
    {
        //dote = new libAntidote::EdtaDimercaprol(age, height, weight);
    }
    //Ca-DTA/Zn-DTPA
    else if ([drugName isEqualToString: @"Ca-DTPA/Zn-DTPA"])
    {
        dote = new libAntidote::CaDTPA(age, height, weight);
    }
    //deferoxamine
    else if ([drugName isEqualToString: @"deferoxamine"])
    {
        dote = new libAntidote::Deferoxamine(age, height, weight);
    }
    //Digoxin Immune FAB
    else if ([drugName isEqualToString: @"Digoxin Immune FAB"])
    {
        dote = new libAntidote::DigiFab(age, height, weight);
    }
    //Dimercaprol for heavy metal
    else if ([drugName isEqualToString: @"dimercaprol (As, Au, or Hg toxicity)"])
    {
        //dote = new libAntidote::Dimercap(age, height, weight);
    }
    //Ethanol for methanol and ethylene glycol
    else if ([drugName isEqualToString: @"ethanol"])
    {
        //dote = new libAntidote::Etoh(age, height, weight);
    }
    //Flumazenil
    else if ([drugName isEqualToString: @"flumazenil"])
    {
        //dote = new libAntidote::Flumazenil(age, height, weight);
    }
    //Fomepizole
    else if ([drugName isEqualToString: @"fomepizole"])
    {
        //dote = new libAntidote::Fomepizole(age, height, weight);
    }
    //Glucagon
    else if ([drugName isEqualToString: @"glucagon"])
    {
        //dote = new libAntidote::Glucagon(age, height, weight);
    }
    //Methylene blue
    else if ([drugName isEqualToString: @"methylene blue"])
    {
        //dote = new libAntidote::MetBlue(age, height, weight);
    }
    //Naloxone
    else if ([drugName isEqualToString: @"naloxone"])
    {
        //dote = new libAntidote::Naloxone(age, height, weight);
    }
    //Octreotide
    else if ([drugName isEqualToString: @"octreotide"])
    {
        //dote = new libAntidote::Octreotide(age, height, weight);
    }
    //Physostigmine
    else if ([drugName isEqualToString: @"physostigmine"])
    {
        //dote = new libAntidote::Physostigmine(age, height, weight);
    }
    //Potassium Iodide
    else if ([drugName isEqualToString: @"potassium iodide"])
    {
        //dote = new libAntidote::PotassiumIodide(age, height, weight);
    }
    //Pralidoxime
    else if ([drugName isEqualToString: @"pralidoxime"])
    {
        //dote = new libAntidote::Pralidoxime(age, height, weight);
    }
    //Prussian Blue
    else if ([drugName isEqualToString: @"prussian blue"])
    {
        //dote = new libAntidote::PrussianBlue(age, height, weight);
    }
    //Pyridoxine vitamin B-6
    else if ([drugName isEqualToString: @"pyridoxine"]||[drugName isEqualToString: @"Vitamin B-6"])
    {
        //dote = new libAntidote::Pyridoxine(age, height, weight);
    }
    //Sodium Bicarbonate
    else if ([drugName isEqualToString: @"sodium bicarbonate"])
    {
        //dote = new libAntidote::SodiumBicarbonate(age, height, weight);
    }
}


- (libAntidote::Antidote *)getDrug {
    return dote;
}
@end
