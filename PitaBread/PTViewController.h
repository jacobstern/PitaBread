//
//  PTViewController.h
//  PitaBread
//

//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
<<<<<<< HEAD
#import "PTCritterScene.h"

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate, UIAccelerometerDelegate>

@property PTCritterScene* scene;
@property UIImagePickerController* picker;
@property (strong, nonatomic) CMMotionManager *motionManager;
=======
#import "PTCritter.h"

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate, UIAccelerometerDelegate>

@property (nonatomic, retain) UIImagePickerController* picker;
@property NSInteger currentImgIdx;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property PTCritter* currentCritter;

@property UIImageView* bowlImage;
@property UIImageView* foodImage;
@property UIImageView* imageOfCritter;

@property BOOL isEating;

@property NSInteger moodCounter;
>>>>>>> 31b0f6500290a945eb3e0edf82c19a1075cd8e02

- (void)transitionToCameraView;

@end
