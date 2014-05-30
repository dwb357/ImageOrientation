//
//  ViewController.h
//  ImageOrientation
//
//  Created by David Berry on 5/30/14.
//  Copyright (c) 2014 TrackingPoint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) IBOutletCollection(UIImageView) NSArray*  imageViews;

@end
