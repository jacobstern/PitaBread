//
//  PTClientSingleton.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTClientSingleton.h"

@implementation PTClientSingleton

@synthesize clientCritter;

static PTClientSingleton *theInstance;

- (id)init
{
    self = [super init];
    if (self) {
        clientCritter = nil;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *critterDictionary = [defaults objectForKey:@"critterDictionary"];
        if (critterDictionary) {
            [clientCritter setValuesForKeysWithDictionary:critterDictionary];
        }
    }
    
    return self;
}

+ (PTClientSingleton *)instance
{
    if (!theInstance)
        theInstance = [[PTClientSingleton alloc] init];
    
    return theInstance;
}

- (void)persistToUserDefaults
{
    if (clientCritter) {
        NSDictionary *critterDictionary = [clientCritter dictionaryWithValuesForKeys:@[@"hunger"]];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:critterDictionary forKey:@"critterDictionary"];
    }
}

@end
