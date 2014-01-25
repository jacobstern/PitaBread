//
//  PTCritter.h
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTCritter : NSObject

@property (nonatomic) int hunger;
@property (nonatomic) int mood; // recovers over time; goes down with scolding; up slightly with hot pockets
@property (nonatomic) int health;

@property (nonatomic) int sleep;
@property (nonatomic) int hygeine;

@property (nonatomic) int training;

@property (nonatomic) bool refuseToEat;

@property (nonatomic) int hoursAlive;

@property (nonatomic) bool isDead;

- (void)feed:(int)pts;
- (void)sleep:(int)pts;
- (void)clean:(int)pts;
- (void)scold;

@end
