//
//  PTViewController.h
//  PitaBread
//

//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface PTViewController : UIViewController<UIImagePickerControllerDelegate>

@property UIImagePickerController* picker;

- (void)transitionToCameraView;

@end
