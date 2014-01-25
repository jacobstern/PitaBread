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

static const NSString *kAnimationKey = @"Animation";

+ (PTCritterSprite *)spriteWithSpriteSheetIdle:(SKTexture *)theSpriteSheet
{
    PTCritterSprite *theSprite = [[PTCritterSprite alloc] init];
    NSMutableArray *spriteTextures = [[NSMutableArray alloc] init];
    int spriteSheetWidth = 6, spriteSheetHeight = 2;
    
    for (int y = 0; y < spriteSheetHeight; y++) {
        for (int x = 0; x < spriteSheetWidth; x++) {
            SKTexture *currentTexture;
            CGRect textureRect = CGRectMake(x / (spriteSheetWidth * 1.0f), y / (spriteSheetHeight * 1.0f), 1.0f / spriteSheetWidth, 1.0f / spriteSheetHeight);
            currentTexture = [SKTexture textureWithRect:textureRect inTexture:theSpriteSheet];
            
            [spriteTextures addObject:currentTexture];
        }
    }
    
    theSprite.size = CGSizeApplyAffineTransform(theSpriteSheet.size, CGAffineTransformMakeScale(1.0f / spriteSheetWidth, 1.0f / spriteSheetHeight));
    
    SKAction *idleAnimation = [SKAction animateWithTextures:spriteTextures timePerFrame:0.042];
    [theSprite runAction:[SKAction repeatActionForever:idleAnimation] withKey:kAnimationKey.copy];
    
    return theSprite;
}


+ (PTCritterSprite *)spriteWithSpriteSheetEating:(SKTexture *)theSpriteSheet
{
    PTCritterSprite *theSprite = [[PTCritterSprite alloc] init];
    NSMutableArray *spriteTextures = [[NSMutableArray alloc] init];
    int spriteSheetWidth = 9, spriteSheetHeight = 5;
    
    for (int y = 0; y < spriteSheetHeight; y++) {
        for (int x = 0; x < 3; x++) {
            if(x+(y*spriteSheetWidth)<40)
            {
                SKTexture *currentTexture;
                CGRect textureRect = CGRectMake(x / (spriteSheetWidth * 1.0f), y / (spriteSheetHeight * 1.0f), 1.0f /   spriteSheetWidth, 1.0f / spriteSheetHeight);
                currentTexture = [SKTexture textureWithRect:textureRect inTexture:theSpriteSheet];
            
                [spriteTextures addObject:currentTexture];
            }
        }
    }
    
    theSprite.size = CGSizeApplyAffineTransform(theSpriteSheet.size, CGAffineTransformMakeScale(1.0f / spriteSheetWidth, 1.0f / spriteSheetHeight));
    
    SKAction *idleAnimation = [SKAction animateWithTextures:spriteTextures timePerFrame:0.042];
    [theSprite runAction:[SKAction repeatActionForever:idleAnimation] withKey:kAnimationKey.copy];
    
    return theSprite;
}



@end
