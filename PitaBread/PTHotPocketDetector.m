//
//  PTHotPocketDetector.m
//  PitaBread
//
//  Created by Jackson Owens on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTHotPocketDetector.h"
#import "PTColorHistogram.h"
#import <Foundation/Foundation.h>

@implementation PTHotPocketDetector

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (bool)isHotPocket:(UIImage*)im {
    PTColorHistogram* hist = [[PTColorHistogram alloc] init:im];
    float total_red = 0;
    for (int i=3*16; i<4*16; i++) {
        total_red += hist.histogram[i];
    }
    if (total_red > .35) {
        return true;
    }
    return false;
}

@end
