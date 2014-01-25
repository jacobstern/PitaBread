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
