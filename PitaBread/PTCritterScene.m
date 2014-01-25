//
//  PTCritterScene.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTClientSingleton.h"
#import "PTCritterScene.h"
#import "PTCritterSprite.h"
#import "PTCritter.h"

@interface PTCritterScene()

@property (nonatomic) SKLabelNode *startPromptLabelNode;
@property (nonatomic) PTCritterSprite *critterSprite;

@end

@implementation PTCritterScene

@synthesize startPromptLabelNode;
@synthesize critterSprite;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        [PTClientSingleton instance].clientCritter = nil;
        
        self.backgroundColor = [SKColor colorWithRed:0.95 green:0.95 blue:1.0 alpha:1.0];
        
        startPromptLabelNode = [SKLabelNode labelNodeWithFontNamed:@"CourierNewPSMT"];
        startPromptLabelNode.fontColor = [UIColor blackColor];
        startPromptLabelNode.text = @"Tap to begin the adventure...";
        startPromptLabelNode.fontSize = 14;
        startPromptLabelNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetHeight(self.frame) - 200.0);
        [self addChild:startPromptLabelNode];
        
        SKTexture *critterTexture = [SKTexture textureWithImageNamed:@"idle.jpg"];
        NSAssert(critterTexture != nil, @"Failed to load critterTexture!");
        critterSprite = [PTCritterSprite spriteWithSpriteSheet:critterTexture];
        critterSprite.position = CGPointMake(CGRectGetMidX(self.frame),
                                                    CGRectGetMidY(self.frame));
        critterSprite.hidden = YES;
        
        [self addChild:critterSprite];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (![PTClientSingleton instance].clientCritter) {
        [PTClientSingleton instance].clientCritter = [[PTCritter alloc] init];
        startPromptLabelNode.hidden = YES;
        critterSprite.hidden = NO;
        critterSprite.position = CGPointMake(CGRectGetMidX(self.frame), 0);
        [critterSprite runAction:[SKAction moveByX:0.0 y:CGRectGetMidY(self.frame) duration:1.0]];
    }
}

-(void)update:(CFTimeInterval)currentTime {
}

@end
