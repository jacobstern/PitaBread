//
//  PTClientSingleton.h
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTCritter.h"

@interface PTClientSingleton : NSObject

+ (PTClientSingleton *)instance;
- (void)persistToUserDefaults;

@property (nonatomic, readwrite) PTCritter *clientCritter;

@end
