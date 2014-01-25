//
//  PTCritterSound.m
//  PitaBread
//
//  Created by Flora on 1/25/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTCritterSound.h"

@implementation PTCritterSound

SystemSoundID mySound;

- (id)init:(NSURL *)soundURL
{
    self = [super init];
    OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &mySound);
    NSLog(@"status = %ld", status);
    return self;
}

- (void) playSound
{
    AudioServicesPlaySystemSound(mySound);
}

@end
