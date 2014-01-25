//
//  PTViewController.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTViewController.h"
#import "PTCritterScene.h"
<<<<<<< HEAD
#import "PTAppDelegate.h"
=======
#import "PTColorHistogram.h"
#import "PTHotPocketDetector.h"
>>>>>>> 4b58f96e55ff5b3659021e39dd109738042170d4

@implementation PTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    PTCritterScene * scene = [PTCritterScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.theParent = self;
    
    // Present the scene.
    [skView presentScene:scene];
    PTHotPocketDetector* dt = [[PTHotPocketDetector alloc] init];
    UIImage* im = [UIImage imageNamed:@"natural_hotpocket.jpg"];
    bool ishp = [dt isHotPocket:im];
    NSLog(ishp ? @"Yes" : @"No");
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)transitionToCameraView
{
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    self.picker.allowsEditing = NO;
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.showsCameraControls = NO;
    
    if (self.picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        //Create camera overlay
        CGRect f = self.picker.view.bounds;
        f.size.height -= self.picker.navigationBar.bounds.size.height;
        CGFloat barHeight = (f.size.height - f.size.width) / 2;
        UIGraphicsBeginImageContext(f.size);
        [[UIColor colorWithWhite:0 alpha:1.0] set];
        UIRectFillUsingBlendMode(CGRectMake(0, 0, f.size.width, barHeight), kCGBlendModeNormal);
        UIRectFillUsingBlendMode(CGRectMake(0, f.size.height - barHeight, f.size.width, barHeight), kCGBlendModeNormal);
        UIImage *overlayImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageView *overlayIV = [[UIImageView alloc] initWithFrame:f];
        overlayIV.image = overlayImage;
        [self.picker.cameraOverlayView addSubview:overlayIV];
    }

    NSInteger lCurrentWidth = self.view.frame.size.width;
    NSInteger lCurrentHeight = self.view.frame.size.height;
    
    NSInteger radius = 60;
    [self presentViewController:self.picker animated:YES completion:NULL];
    [self drawCaptureCircle:lCurrentWidth/2 - radius/2 :lCurrentHeight -  radius - 20 :radius :[self.picker view]];
}


-(void)drawCaptureCircle:(NSInteger)x :(NSInteger)y :(NSInteger)radius :(UIView*)addingView {
    
    NSInteger borderRadius = 10;
    UIView* circleBorder = [[UIView alloc] initWithFrame:CGRectMake(x-borderRadius/2,y-borderRadius/2,radius+borderRadius,radius+borderRadius)];
    circleBorder .alpha = 1.0;
    circleBorder.layer.cornerRadius = (radius+borderRadius)/2;
    circleBorder.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [addingView addSubview:(circleBorder)];
    
    UIView* circleView = [[UIView alloc] initWithFrame:CGRectMake(x,y,radius,radius)];
    circleView.alpha = 1.0;
    circleView.layer.cornerRadius = radius/2;
    circleView.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    [addingView addSubview:(circleView)];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pictureButtonTapped)];
    singleTap.numberOfTapsRequired = 1;
    circleView.userInteractionEnabled = YES;
    [circleView addGestureRecognizer:singleTap];
}

- (void)pictureButtonTapped
{
    [self.picker takePicture];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
                                             (unsigned long)NULL), ^(void) {
        UIImage *anImage = [info valueForKey:UIImagePickerControllerOriginalImage];

        CGSize imageSize = anImage.size;
        CGFloat width = imageSize.width;
        CGFloat height = imageSize.height;
        if (width != height) {
            CGFloat newDimension = MIN(width, height);
            CGFloat widthOffset = (width - newDimension) / 2;
            CGFloat heightOffset = (height - newDimension) / 2;
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension, newDimension), NO, 0.);
            [anImage drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
                 blendMode:kCGBlendModeCopy
                     alpha:1.];
            anImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    
        NSData *imageData = UIImageJPEGRepresentation(anImage, 1.0);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        NSString *tmpPathToFile = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/specificImagedName.jpg", path]];
        appDelegate.imageName = tmpPathToFile;
        appDelegate.pictureTaken = YES;
    
        if([imageData writeToFile:tmpPathToFile atomically:YES]){
        //Write was successful.
        }
    });
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
