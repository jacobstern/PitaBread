//
//  PTColorHistogram.m
//  PitaBread
//
//  Created by Flora on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTColorHistogram.h"

@implementation PTColorHistogram

- (id)init:(UIImage *)im
{
    self = [super init];
    [self extractPixelData:im];
    [self makeHistogram];
    [self normalizeHistogram];
    return self;
}

- (unsigned char *)extractPixelData:(UIImage *)im
{
    // First get the image into your data buffer
    CGImageRef image = [im CGImage];
    NSUInteger width = CGImageGetWidth(image);
    NSUInteger height = CGImageGetHeight(image);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = malloc(height * width * 4);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
    CGContextRelease(context);
    self.data = rawData;
    self.height = height;
    self.width = width;
    return rawData;
}

- (void)makeHistogram
{
    NSMutableArray* a = [NSMutableArray alloc];
    float *histogram = malloc(4 * 4 * 4 * sizeof(float));
    memset(histogram, 0, 64);
    for (int i=0; i<self.height; i++) {
        for (int j=0; j<self.width; j++) {
            int byteIndex = (self.width * 4 * i) + j * 4;
            int red = self.data[byteIndex];
            int green = self.data[byteIndex + 1];
            int blue = self.data[byteIndex + 2];
            int alpha = self.data[byteIndex + 3];
            int bucketIndex = red*16 + green*4 + blue;
            histogram[bucketIndex]++;
        }
    }
    self.histogram = histogram;
}

- (void)normalizeHistogram
{
    for (int i=0; i<64; i++) {
        self.histogram[i] = self.histogram[i]/(self.height*self.width);
    }
}

@end
