//
//  PTViewController.h
//  PitaBread
//

//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "PTCritter.h"
#import "PTBackgroundView.h"

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate, UIAccelerometerDelegate>

@property (nonatomic, retain) UIImagePickerController* picker;
@property NSInteger currentImgIdx;
@property (strong, nonatomic) CMMotionManager *motionManager;

@property PTCritter* currentCritter;
@property PTCritter* critterData;

@property UIImageView* bowlImage;
@property UIImageView* foodImage;
@property UIImageView* imageOfCritter;
@property UIImageView* speechImage;
@property (weak, nonatomic) IBOutlet PTBackgroundView *backgroundView;
@property NSTimer *messageTimer;

@property BOOL isInitialLoad;
@property BOOL critterBeingBorn;
@property BOOL isEating;

@property NSInteger moodCounter;

- (void)transitionToCameraView;

- (void)closeSpeechBubble;
- (void)showSpeechBubble:(NSString *)imageName duration:(NSTimeInterval)duration;

@end
