//
//  PTCritterSound.h
//  PitaBread
//
//  Created by Flora on 1/25/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface PTCritterSound : NSObject

@property SystemSoundID mySound;

- (id)init:(NSURL *)soundURL;
- (void) playSound;

@end
