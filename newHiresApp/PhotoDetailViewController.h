//
//  PhotoDetailViewController.h
//  SavingImagesTutorial
//
//  Created by Sidwyn Koh on 29/1/12.
//  Copyright (c) 2012 Parse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailViewController : UIViewController
{
    IBOutlet UIImageView *photoImageView;
    UIImage *selectedImage;
    NSString *imageName;
}
@property (nonatomic, retain) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) NSString *imageName;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *roleText;
@property (weak, nonatomic) IBOutlet UITextField *deptText;
@property (weak, nonatomic) IBOutlet UITextField *gpText;

@property (nonatomic, assign) NSString *personname;
@property (nonatomic, assign) NSString *personrole;
@property (nonatomic, assign) NSString *persondept;
@property (nonatomic, assign) NSString *persongp;

- (IBAction)close:(id)sender;
@end
