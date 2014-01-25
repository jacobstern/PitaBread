//
//  PTViewController.h
//  PitaBread
//

//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "PTCritter.h"
#import "PTBackgroundView.h"

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate, UIAccelerometerDelegate>

@property UIImagePickerController* picker;
@property NSInteger currentImgIdx;
@property (strong, nonatomic) CMMotionManager *motionManager;

@property PTCritter* currentCritter;
@property PTCritter* critterData;

@property UIImageView* bowlImage;
@property UIImageView* foodImage;
@property UIImageView* imageOfCritter;
@property UIImageView* imageOfEgg;
@property UIImageView* speechImage;
@property UIImageView* circleImage;
@property UIImageView* splashImage;
@property (weak, nonatomic) IBOutlet PTBackgroundView *backgroundView;
@property NSTimer *messageTimer;

@property BOOL isInitialLoad;
@property BOOL critterBeingBorn;
@property BOOL isEating;
@property BOOL isHatching;
@property BOOL isDead;

@property NSInteger moodCounter;
@property NSInteger hatchingCounter;

@property AVAudioRecorder *recorder;
@property double lowPassResults;

@property BOOL suppressHungryMessage;

- (void)transitionToCameraView;

- (void)closeSpeechBubble;
- (void)showSpeechBubble:(NSString *)imageName duration:(NSTimeInterval)duration;
- (BOOL)isShowingSpeechBubble;

@end
