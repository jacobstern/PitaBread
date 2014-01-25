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
#import "PTCritterSprite.h"
#import "PTCritter.h"
#import "PTViewController.h"
#import "PTAppDelegate.h"

@interface PTCritterScene()

@property (nonatomic) SKLabelNode *startPromptLabelNode;
@property (nonatomic) PTCritterSprite *critterSprite;

@end

@implementation PTCritterScene

@synthesize startPromptLabelNode;
@synthesize theParent;
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
        critterSprite = [PTCritterSprite spriteWithSpriteSheetIdle:critterTexture];
        critterSprite.position = CGPointMake(CGRectGetMidX(self.frame),
                                                    CGRectGetMidY(self.frame));
        critterSprite.hidden = YES;
        
        [self addChild:critterSprite];
    }
    return self;
}


-(void)drawCameraCircle
{
    NSInteger lCurrentHeight = self.view.frame.size.height;
    
    NSInteger radius = 60;
    UIImageView* circleImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, lCurrentHeight-radius-30, radius, radius)];
    circleImage.image = [UIImage imageNamed:@"camera.png"];
    [self.view addSubview:(circleImage)];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToCamera)];
    singleTap.numberOfTapsRequired = 1;
    circleImage.userInteractionEnabled = YES;
    [circleImage addGestureRecognizer:singleTap];
}

-(void)goToCamera
{
    [(PTViewController*)theParent transitionToCameraView];
}

-(void)addSwipeGesture
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToCamera)];
    swipeGesture.direction = (UISwipeGestureRecognizerDirectionUp);
    [self.view addGestureRecognizer:swipeGesture];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    if (![PTClientSingleton instance].clientCritter) {
        [PTClientSingleton instance].clientCritter = [[PTCritter alloc] init];
        startPromptLabelNode.hidden = YES;
        critterSprite.hidden = NO;
        critterSprite.position = CGPointMake(CGRectGetMidX(self.frame), 0);
        [critterSprite runAction:[SKAction moveByX:0.0 y:CGRectGetMidY(self.frame) duration:1.0]];
        [self drawCameraCircle];
        [self addSwipeGesture];
    }
}

-(void)putEatingSprite
{
    [self removeAllChildren];
    SKTexture *critterTexture = [SKTexture textureWithImageNamed:@"sprite_eating.png"];
    NSAssert(critterTexture != nil, @"Failed to load critterTexture!");
    critterSprite = [PTCritterSprite spriteWithSpriteSheetEating:critterTexture];
    critterSprite.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMidY(self.frame));
    [self addChild:critterSprite];
}

-(void)putBowl
{
    NSInteger lCurrentHeight = self.view.frame.size.height;
    NSInteger lCurrentWidth = self.view.frame.size.width;
    
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    SKSpriteNode * bowlImage = [SKSpriteNode new];
    bowlImage = [SKSpriteNode spriteNodeWithImageNamed:[appDelegate imageName]];
    [bowlImage setScale:1.0];
    bowlImage.position = CGPointMake(120,160);
    
    [self addChild:bowlImage];
}

-(void)update:(CFTimeInterval)currentTime {
    if ([[PTClientSingleton instance] clientCritter]) {
        startPromptLabelNode.hidden = YES;
    }
    
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    PTHotPocketDetector* hotPocketDetector = [[PTHotPocketDetector alloc] init];
    
    if(appDelegate.pictureTaken)
    {
        self.isEating = TRUE;
        [self putBowl];
    }
    
    if(appDelegate.pictureTaken)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
                                             (unsigned long)NULL), ^(void) {
            
            NSData *imageData = [NSData dataWithContentsOfFile:[appDelegate imageName]];
            
            UIImageView *pictureView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 16, 302, 77)];
            pictureView.image = [UIImage imageWithData:imageData];
    
            if([hotPocketDetector isHotPocket:pictureView.image])
                NSLog(@"Is HotPocket");
            else
                NSLog(@"Not HotPocket");
            self.isEating = FALSE;
        });
        appDelegate.pictureTaken = NO;
    }
}

@end
