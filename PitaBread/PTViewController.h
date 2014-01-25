//
//  PTViewController.h
//  PitaBread
//

//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <CoreMotion/CoreMotion.h>
#import "PTCritterScene.h"

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate, UIAccelerometerDelegate>

@property PTCritterScene* scene;
@property UIImagePickerController* picker;
@property (strong, nonatomic) CMMotionManager *motionManager;

- (void)transitionToCameraView;

@end
