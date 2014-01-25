//
//  PTCritterSound.m
//  PitaBread
//
//  Created by Flora on 1/25/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTCritterSound.h"

@implementation PTCritterSound

- (id)init:(NSURL *)soundURL
{
    self = [super init];
    SystemSoundID mySound;
    OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &mySound);
    self.mySound = mySound;
    NSLog(@"status = %ld", status);
    NSLog(@"Setting up sound %p, %u", self, (unsigned int)mySound);
    return self;
}

- (void) playSound
{
    NSLog(@"Playing sound %p, %u", self, (unsigned int)self.mySound);
    AudioServicesPlaySystemSound(self.mySound);
}

@end
