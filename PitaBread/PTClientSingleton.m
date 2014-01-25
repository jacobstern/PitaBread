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
        clientCritter = NULL;
    }
    
    return self;
}

+ (PTClientSingleton *)instance
{
    if (!theInstance)
        theInstance = [[PTClientSingleton alloc] init];
    
    return theInstance;
}

@end
