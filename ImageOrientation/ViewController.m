//
//  ViewController.m
//  ImageOrientation
//
//  Created by David Berry on 5/30/14.
//  Copyright (c) 2014 TrackingPoint. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView*                _targetView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    for(UIImageView* imageView in _imageViews)
    {
        CALayer*    layer = imageView.layer;
        layer.borderWidth = 1.;
        layer.borderColor = [UIColor blackColor].CGColor;
    }
}

- (IBAction)takePicture:(UITapGestureRecognizer*)sender
{
    _targetView = nil;
    
    // Find the containing UIImageView
    for(UIImageView* imageView in _imageViews)
    {
        if(CGRectContainsPoint(imageView.bounds, [sender locationInView:imageView]))
        {
            _targetView = imageView;
        }
    }
    
    if(_targetView)
    {
        UIImagePickerController*    picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:true completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];

    UIImage*                original = info[UIImagePickerControllerOriginalImage];
    CGImageRef              cgImage = original.CGImage;
    UIImage*                natural = [UIImage imageWithCGImage:cgImage];
    
    _targetView.image = natural;
}

@end
