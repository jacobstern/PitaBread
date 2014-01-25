//
//  PTAppDelegate.h
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTAppDelegate : UIResponder <UIApplicationDelegate>

@property NSMutableArray* arrayOfCritters;
@property (strong, nonatomic) UIWindow *window;
@property NSData* imageData;
@property BOOL pictureTaken;

@end
