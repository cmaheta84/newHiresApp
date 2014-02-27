//
//  ViewController.h
//  SavingImagesTutorial
//
//  Created by Sidwyn Koh on 29/1/12.
//  Copyright (c) 2012 Parse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/parse.h>
#import "MBProgressHUD.h"
#include <stdlib.h> // For math functions including arc4random (a number randomizer)

@interface SocialViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, MBProgressHUDDelegate>
{
    IBOutlet UIScrollView *photoScrollView;
    NSMutableArray *allPeople;
    
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;

}
@property (nonatomic, retain) NSString *personName;
@property (nonatomic, retain) NSString *personRole;
@property (nonatomic, retain) NSString *personDept;
@property (nonatomic, retain) NSString *personGP;
- (IBAction)refresh:(id)sender;
- (IBAction)cameraButtonTapped:(id)sender;
- (void)uploadImage:(NSData *)imageData;
- (void)setUpImages:(NSArray *)images;
- (void)buttonTouched:(id)sender;

@end
