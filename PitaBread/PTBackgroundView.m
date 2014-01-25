//
//  PTBackgroundView.m
//  PitaBread
//
//  Created by Jacob Stern on 1/25/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTBackgroundView.h"

@implementation PTBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx,5);
    CGContextSetRGBStrokeColor(ctx,0.8,0.8,0.8,1.0);
    CGContextAddArc(ctx, 30.0,30.0, 30, 0.0, M_PI*2, YES);
    CGContextStrokePath(ctx);
}

- (void)nextFrame
{
   
}

@end
