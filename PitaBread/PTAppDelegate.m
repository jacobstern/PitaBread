//
//  PTAppDelegate.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTAppDelegate.h"
#import "PTCritter.h"

@implementation PTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.arrayOfCritters = [[NSMutableArray alloc] init];
    
    PTCritter* eatingCritter = [[PTCritter alloc] init];
    eatingCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating1.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating2.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating3.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating4.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating5.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating6.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating7.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating8.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating9.png"]];
    [[eatingCritter arrayOfImages] addObject:[UIImage imageNamed:@"eating10.png"]];
    
    [self.arrayOfCritters addObject:eatingCritter];
    
    PTCritter* idleCritter = [[PTCritter alloc] init];
    idleCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle1.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle2.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle3.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle4.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle5.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle6.png"]];
    [[idleCritter arrayOfImages] addObject:[UIImage imageNamed:@"idle7.png"]];
    
    [self.arrayOfCritters addObject:idleCritter];
    
    
    PTCritter* happyCritter = [[PTCritter alloc] init];
    happyCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy1.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy2.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy3.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy4.png"]];
    [[happyCritter arrayOfImages] addObject:[UIImage imageNamed:@"happy5.png"]];
    
    [self.arrayOfCritters addObject:happyCritter];
    
    
    PTCritter* madCritter = [[PTCritter alloc] init];
    madCritter.arrayOfImages = [[NSMutableArray alloc] init];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad1.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad2.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad3.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad4.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad5.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad6.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad7.png"]];
    [[madCritter arrayOfImages] addObject:[UIImage imageNamed:@"mad8.png"]];
    
    [self.arrayOfCritters addObject:madCritter];
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
