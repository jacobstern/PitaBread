//
//  PTCritterSprite.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTCritterSprite.h"

@interface PTCritterSprite()

@property (nonatomic) NSArray *idleTextures;

@end

@implementation PTCritterSprite

+ (PTCritterSprite *)withTextureAtlas:(SKTextureAtlas *)atlas
{
    PTCritterSprite *theSprite = [[PTCritterSprite alloc] init];
    
    return theSprite;
}

@end
