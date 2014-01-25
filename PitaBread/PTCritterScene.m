//
//  PTCritterScene.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTClientSingleton.h"
#import "PTCritterScene.h"
#import "PTHotPocketDetector.h"
#import "PTCritter.h"
#import "PTAppDelegate.h"

@interface PTCritterScene()

@property (nonatomic) SKLabelNode* startPromptLabelNode;

@end

@implementation PTCritterScene

@synthesize startPromptLabelNode;
@synthesize theParent;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.95 green:0.95 blue:1.0 alpha:1.0];
        
        startPromptLabelNode = [SKLabelNode labelNodeWithFontNamed:@"CourierNewPSMT"];
        
        startPromptLabelNode.text = @"Tap to begin the adventure...";
        startPromptLabelNode.fontSize = 14;
        startPromptLabelNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:startPromptLabelNode];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [theParent transitionToCameraView];
    
    if (![PTClientSingleton instance].clientCritter) {
        [PTClientSingleton instance].clientCritter = [[PTCritter alloc] init];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    if ([[PTClientSingleton instance] clientCritter]) {
        startPromptLabelNode.hidden = YES;
    }
    
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    PTHotPocketDetector* hotPocketDetector = [[PTHotPocketDetector alloc] init];
    
    if(appDelegate.pictureTaken)
    {
        NSData *imageData = [NSData dataWithContentsOfFile:[appDelegate imageName]];
    
        UIImageView *creditCardImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 16, 302, 77)];
        creditCardImageView.image = [UIImage imageWithData:imageData];
    
        [self.view addSubview:creditCardImageView];
    
        if([hotPocketDetector isHotPocket:creditCardImageView.image])
            NSLog(@"Is HotPocket");
        else
            NSLog(@"Not HotPocket");
        appDelegate.pictureTaken = NO;
    }
}

@end
