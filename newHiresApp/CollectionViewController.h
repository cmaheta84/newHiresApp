//
//  CollectionViewController.h
//  newHiresApp
//
//  Created by Ben Chen on 2/25/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/parse.h>
#import "MBProgressHUD.h"

@interface CollectionViewController : UICollectionViewController <UIImagePickerControllerDelegate, MBProgressHUDDelegate>
- (IBAction)cameraPressed:(id)sender;
- (IBAction)refreshPressed:(id)sender;

@end
