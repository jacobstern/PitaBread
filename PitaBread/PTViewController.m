//
//  PTViewController.m
//  PitaBread
//
//  Created by Jacob Stern on 1/24/14.
//  Copyright (c) 2014 Team Name Optional. All rights reserved.
//

#import "PTViewController.h"
#import "PTAppDelegate.h"
#import "PTColorHistogram.h"
#import "PTHotPocketDetector.h"

@implementation PTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //GUARD FOR NO CAMERA
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else {
        [self prepareThePicker];
    }
    
    
    self.isInitialLoad = TRUE;
    self.critterBeingBorn = FALSE;
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateImgIdx) userInfo:nil repeats:YES];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];
    
    self.moodCounter = 0;
    
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:1];
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(critterBorn)];
    singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:singleTap];
}

- (void)critterBorn
{
    if([self isInitialLoad] && ![self critterBeingBorn])
    {
        NSInteger lCurrentWidth = self.view.frame.size.width;
        NSInteger lCurrentHeight = self.view.frame.size.height;
        NSInteger dimensions = 200;
        [self.imageOfCritter removeFromSuperview];
        self.imageOfCritter = [[UIImageView alloc] initWithFrame:CGRectMake(lCurrentWidth/2-dimensions/2, lCurrentHeight+20, dimensions, dimensions)];
        self.imageOfCritter.image = [[self.currentCritter arrayOfImages] objectAtIndex:self.currentImgIdx];
        [[self view] addSubview:self.imageOfCritter];
    
        [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageOfCritter.frame = CGRectMake(lCurrentWidth/2-dimensions/2, lCurrentHeight/2-dimensions/2, self.imageOfCritter.frame.size.width, self.imageOfCritter.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.isInitialLoad = FALSE;
                         }
                     }];
    }
    self.critterBeingBorn = TRUE;
}

- (void)prepareThePicker
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
        
        UILabel *label1 =  [[UILabel alloc] initWithFrame: CGRectMake(80, 30, f.size.width-40, 50)];
        label1.text = @"FEED ME!";
        label1.textColor = [UIColor whiteColor];
        [label1 setFont:[UIFont systemFontOfSize:34]];
        [self.picker.view addSubview:label1];
        
        [[UIColor blackColor] set];
        UIRectFillUsingBlendMode(CGRectMake(0, 0, f.size.width, barHeight), kCGBlendModeNormal);
        UIRectFillUsingBlendMode(CGRectMake(0, f.size.height - barHeight, f.size.width, barHeight), kCGBlendModeNormal);
        UIImage *overlayImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        UILabel *label2 =  [[UILabel alloc] initWithFrame: CGRectMake(50, f.size.height - barHeight + 10, f.size.width-40,  50)];
        label2.text = @"HOT POCKETS!";
        label2.textColor = [UIColor whiteColor];
        [label2 setFont:[UIFont systemFontOfSize:34]];
        [self.picker.view addSubview:label2];
        
        UIImageView *overlayIV = [[UIImageView alloc] initWithFrame:f];
        overlayIV.image = overlayImage;
        [self.picker.cameraOverlayView addSubview:overlayIV];
    }

}

- (void)drawTheCritter
{
    NSInteger lCurrentWidth = self.view.frame.size.width;
    NSInteger lCurrentHeight = self.view.frame.size.height;
    NSInteger dimensions = 200;
    [self.imageOfCritter removeFromSuperview];
    self.imageOfCritter = [[UIImageView alloc] initWithFrame:CGRectMake(lCurrentWidth/2-dimensions/2, lCurrentHeight/2-dimensions/2, dimensions, dimensions)];
    self.imageOfCritter.image = [[self.currentCritter arrayOfImages] objectAtIndex:self.currentImgIdx];
    [[self view] addSubview:self.imageOfCritter];
}

- (void)updateImgIdx
{
    [self.backgroundView nextFrame];
    [self.backgroundView setNeedsDisplay];
    
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.moodCounter --;
    if(self.moodCounter <= 0 && !self.isEating)
    {
        self.moodCounter = 0;
        self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:1];
    }
    
    self.currentImgIdx ++;
    if(self.currentImgIdx >= [[self.currentCritter arrayOfImages] count])
    {
        self.currentImgIdx = 0;
    }
    
    if(!self.isInitialLoad)
    {
        [self checkPictureTaken];
        [self drawTheCritter];
        [self drawCameraCircle];
    }
}

-(void)drawBowl
{
    NSInteger lCurrentHeight = self.view.frame.size.height;
    NSInteger lCurrentWidth = self.view.frame.size.width;
    
    NSInteger dimensions = 100;
    self.bowlImage = [[UIImageView alloc] initWithFrame:CGRectMake(lCurrentWidth, 30, dimensions, dimensions)];
    self.bowlImage.image = [UIImage imageNamed:@"bowl.png"];
    
    [self.view addSubview:self.bowlImage];
    
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.bowlImage.frame = CGRectMake(lCurrentWidth/2 + 40, lCurrentHeight/2 + 40, self.bowlImage.frame.size.width, self.bowlImage.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self drawImage];
                         }
    }];
}

-(void) drawImage
{
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSInteger lCurrentHeight = self.view.frame.size.height;
    NSInteger lCurrentWidth = self.view.frame.size.width;
    
    [self.bowlImage removeFromSuperview];
    
    self.bowlImage = [[UIImageView alloc] initWithFrame:CGRectMake(lCurrentWidth/2 + 40, lCurrentHeight/2 + 40, 100, 100)];
    self.bowlImage.image = [UIImage imageNamed:@"bowl.png"];
    
    NSInteger dimensions = 40;
    self.foodImage = [[UIImageView alloc] initWithFrame:CGRectMake(lCurrentWidth, 30, dimensions+20, dimensions)];
    NSData *imageData = [appDelegate imageData];
    self.foodImage.image = [UIImage imageWithData:imageData];
    [self.view addSubview:self.foodImage];
    [self.view addSubview:self.bowlImage];
    
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.foodImage.frame = CGRectMake(lCurrentWidth/2 + 60, lCurrentHeight/2 + 30, self.foodImage.frame.size.width, self.foodImage.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:0];
                             
                         }
                     }];
}

- (BOOL)checkPictureTaken
{
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    if([appDelegate pictureTaken])
    {
        self.isEating = TRUE;

        PTHotPocketDetector* hotPocketDetector = [[PTHotPocketDetector alloc] init];
        appDelegate.pictureTaken = FALSE;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
                                                 (unsigned long)NULL), ^(void) {
            
            NSData *imageData = [appDelegate imageData];
            
            UIImageView *pictureView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 16, 302, 77)];
            pictureView.image = [UIImage imageWithData:imageData];
            
            if([hotPocketDetector isHotPocket:pictureView.image])
            {
                NSLog(@"Is HotPocket");
                self.moodCounter = 10;
                self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:2];
            }
            else
            {
                NSLog(@"Not HotPocket");
                self.moodCounter = 10;
                self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:3];
            }
            [self.foodImage removeFromSuperview];
            [self.bowlImage removeFromSuperview];
            self.isEating = FALSE;
        });
        [self drawBowl];
        appDelegate.pictureTaken = NO;
    }
    return FALSE;
}

- (void)transitionToCameraView
{
    if (self.isEating || self.isInitialLoad)
        return;
    else {
        self.isEating= YES;
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(screenSwiped)];
        swipeGesture.direction = (UISwipeGestureRecognizerDirectionDown);
        [self.picker.view addGestureRecognizer:swipeGesture];

        NSInteger lCurrentWidth = self.view.frame.size.width;
        NSInteger lCurrentHeight = self.view.frame.size.height;
    
        NSInteger radius = 60;
        [self presentViewController:self.picker animated:YES completion:NULL];
        [self drawCaptureCircle:lCurrentWidth/2 - radius/2 :lCurrentHeight -  radius - 20 :radius :[self.picker view]];
    }
}

-(void)addSwipeGestureForCamera
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(transitionToCameraView)];
    swipeGesture.direction = (UISwipeGestureRecognizerDirectionUp);
    [self.view addGestureRecognizer:swipeGesture];
}

-(void)screenSwiped
{
    self.isEating = FALSE;
    [self.picker dismissViewControllerAnimated:YES completion:NULL];
    [self.picker removeFromParentViewController];
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

-(void)drawCameraCircle
{
    NSInteger lCurrentHeight = self.view.frame.size.height;
    
    NSInteger radius = 60;
    UIImageView* circleImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, lCurrentHeight-radius-30, radius, radius)];
    circleImage.image = [UIImage imageNamed:@"camera.png"];
    [self.view addSubview:(circleImage)];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(transitionToCameraView)];
    singleTap.numberOfTapsRequired = 1;
    circleImage.userInteractionEnabled = YES;
    
    [self addSwipeGestureForCamera];
    [circleImage addGestureRecognizer:singleTap];
}

- (void)pictureButtonTapped
{
    [self.picker takePicture];
    [self.picker removeFromParentViewController];
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
        
        appDelegate.imageData = imageData;
        appDelegate.pictureTaken = YES;
        [self.picker removeFromParentViewController];
    });
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    //TODO: For the movements accelormeter;
    if(acceleration.x > 0.5 || acceleration.y > 0.5 || acceleration.z > 0.5)
    {
        [self unhappyCritter];
    }
}
-(void)outputRotationData:(CMRotationRate)rotation
{    //TODO: For the movements accelormeter;
    if(rotation.x > 0.5 || rotation.y > 0.5 || rotation.z > 0.5)
    {
        [self unhappyCritter];
    }
}

-(void) unhappyCritter
{
    PTAppDelegate* appDelegate = (PTAppDelegate *)[[UIApplication sharedApplication] delegate];
    if(!self.isEating)
    {
        self.currentCritter = [[appDelegate arrayOfCritters] objectAtIndex:3];
        self.moodCounter = 10;
    }}

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
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    // Release any cached data, images, etc that aren't in use.
}

@end
