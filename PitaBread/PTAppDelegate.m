//
//  PTAppDelegate.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTAppDelegate.h"
#import "PTCritter.h"
#import "PTCritterSound.h"

@implementation PTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.arrayOfCritters = [[NSMutableArray alloc] init];
    self.arrayOfMusic = [[NSMutableArray alloc] init];
    
    //0: angry
    //NSURL *url = [NSURL fileURLWithPath:
    //                [[NSBundle mainBundle] pathForResource:@"angry" ofType:@"wav"  inDirectory:@"PitaBread/music" ]];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"angry" withExtension:@".wav"];
    PTCritterSound* angrySound = [[PTCritterSound alloc] init:url];
    [self.arrayOfMusic addObject:angrySound];
    
    //0: eating 1: normal 2:happy 3: mad 4: full 5: sleepy 6: sad 7: mad_very 8: sleepy_very 9: hungry 10: hungry_very
    
    PTCritter* eatingCritter = [[PTCritter alloc] init];
    eatingCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0001.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0002.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0003.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0004.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0005.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0006.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0007.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0008.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0009.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0010.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0011.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0012.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0013.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0014.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0015.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0016.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0017.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0018.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0019.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating_0020.png"]];
    
    [self.arrayOfCritters addObject:eatingCritter];
    
    PTCritter* normalCritter = [[PTCritter alloc] init];
    normalCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0001.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0002.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0003.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0004.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0005.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0006.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0007.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0008.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0009.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0010.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0011.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0012.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0013.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0014.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0015.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0016.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0017.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0018.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0019.png"]];
    [[normalCritter arrayOfImages] addObject:[UIImage imageNamed:@"normal_0020.png"]];
    [self.arrayOfCritters addObject:normalCritter];
    
    
    PTCritter* happyCritter = [[PTCritter alloc] init];
    happyCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0001.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0002.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0003.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0004.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0005.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0006.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0007.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0008.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0009.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0010.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0011.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0012.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0013.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0014.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0015.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0016.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0017.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0018.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0019.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy_0020.png"]];
    
    [self.arrayOfCritters addObject:happyCritter];
    
    
    PTCritter* madCritter = [[PTCritter alloc] init];
    madCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0001.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0002.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0003.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0004.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0005.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0006.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0007.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0008.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0009.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0010.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0011.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0012.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0013.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0014.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0015.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0016.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0017.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0018.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0019.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_0020.png"]];
    
    [self.arrayOfCritters addObject:madCritter];
    
    
    PTCritter* fullCritter = [[PTCritter alloc] init];
    fullCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0001.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0002.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0003.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0004.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0005.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0006.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0007.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0008.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0009.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0010.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0011.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0012.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0013.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0014.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0015.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0016.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0017.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0018.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0019.png"]];
    [[fullCritter arrayOfImages] addObject:[UIImage imageNamed:@"full_0020.png"]];
    
    [self.arrayOfCritters addObject:fullCritter];
    
    
    PTCritter* sleepyCritter = [[PTCritter alloc] init];
    sleepyCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0001.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0002.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0003.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0004.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0005.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0006.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0007.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0008.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0009.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0010.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0011.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0012.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0013.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0014.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0015.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0016.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0017.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0018.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0019.png"]];
    [[sleepyCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_0020.png"]];
    
    [self.arrayOfCritters addObject:sleepyCritter];
    
    
    PTCritter* sadCritter = [[PTCritter alloc] init];
    sadCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0001.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0002.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0003.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0004.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0005.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0006.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0007.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0008.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0009.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0010.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0011.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0012.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0013.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0014.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0015.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0016.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0017.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0018.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0019.png"]];
    [[sadCritter arrayOfImages] addObject:[UIImage imageNamed:@"sad_0020.png"]];
    
    [self.arrayOfCritters addObject:sadCritter];
    
    PTCritter* mad_veryCritter = [[PTCritter alloc] init];
    mad_veryCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0001.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0002.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0003.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0004.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0005.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0006.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0007.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0008.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0009.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0010.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0011.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0012.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0013.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0014.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0015.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0016.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0017.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0018.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0019.png"]];
    [[mad_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad_very_0020.png"]];
    
    [self.arrayOfCritters addObject:mad_veryCritter];
    
    
    PTCritter* sleepy_veryCritter = [[PTCritter alloc] init];
    sleepy_veryCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0001.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0002.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0003.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0004.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0005.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0006.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0007.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0008.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0009.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0010.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0011.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0012.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0013.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0014.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0015.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0016.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0017.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0018.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0019.png"]];
    [[sleepy_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"sleepy_very_0020.png"]];
    
    [self.arrayOfCritters addObject:sleepy_veryCritter];
    
    
    
    PTCritter* hungryCritter = [[PTCritter alloc] init];
    hungryCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0001.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0002.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0003.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0004.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0005.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0006.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0007.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0008.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0009.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0010.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0011.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0012.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0013.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0014.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0015.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0016.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0017.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0018.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0019.png"]];
    [[hungryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_0020.png"]];
    
    [self.arrayOfCritters addObject:hungryCritter];
    
    
    PTCritter* hungry_veryCritter = [[PTCritter alloc] init];
    hungry_veryCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0001.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0002.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0003.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0004.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0005.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0006.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0007.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0008.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0009.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0010.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0011.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0012.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0013.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0014.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0015.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0016.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0017.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0018.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0019.png"]];
    [[hungry_veryCritter arrayOfImages] addObject:[UIImage imageNamed:@"hungry_very_0020.png"]];
    
    [self.arrayOfCritters addObject:hungry_veryCritter];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
