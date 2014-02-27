//
//  SocialDetailsViewController.m
//  newHiresApp
//
//  Created by Chandni Maheta on 1/31/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "SocialDetailsViewController.h"
#import "SocialViewController.h"
#import "T1Autograph.h"

@interface SocialDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *roleText;
@property (weak, nonatomic) IBOutlet UITextField *gpText;
@property (weak, nonatomic) IBOutlet UITextField *deptText;
- (IBAction)onSubmit:(id)sender;

@property (strong) T1Autograph *autograph;
@property (strong) T1Autograph *autographModal;

@end

@implementation SocialDetailsViewController
MBProgressHUD *HUD;
MBProgressHUD *refreshHUD;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithData:self.imagedata];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(onSubmit:)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onSubmit:(id)sender {
    
    self.autographModal = [T1Autograph autographWithDelegate:self modalDisplayString:@"Sign Below:"];
	
	// Show modal view without a message above the signature line
	//	self.autographModal = [T1Autograph autographWithDelegate:self modalDisplayString:nil];
	
	// Remove the watermark
	[self.autographModal setLicenseCode:@"4fabb271f7d93f07346bd02cec7a1ebe10ab7bec"];
	
	// any optional configuration done here
	[self.autographModal setShowDate:YES];
	[self.autographModal setStrokeColor:[UIColor lightGrayColor]];
    
    /*
    SocialViewController *VC = [[SocialViewController alloc] init];
    VC.personName = self.nameText.text;
    VC.personRole = self.roleText.text;
    VC.personDept = self.deptText.text;
    VC.personGP = self.gpText.text;

    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    
    //HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    // Set determinate mode
    HUD.mode = MBProgressHUDModeDeterminate;
    //HUD.delegate = self;
    HUD.labelText = @"Uploading";
    [HUD show:YES];
    
    // Save PFFile
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //Hide determinate HUD
            [HUD hide:YES];
            
            // Show checkmark
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUD];
            
            // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
            // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
            HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            
            // Set custom view mode
            HUD.mode = MBProgressHUDModeCustomView;
            
            //HUD.delegate = self;
            
            // Create a PFObject around a PFFile and associate it with the current user
            PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
            [userPhoto setObject:imageFile forKey:@"imageFile"];
            
            // Set the access control list to current user for security purposes
            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            PFUser *user = [PFUser currentUser];
            [userPhoto setObject:user forKey:@"user"];
            [userPhoto setObject:self.nameText.text forKey:@"username"];
            [userPhoto setObject:self.roleText.text forKey:@"userrole"];
            [userPhoto setObject:self.deptText.text forKey:@"userdept"];
            [userPhoto setObject:self.gpText.text forKey:@"usergp"];
           
            NSDate *currDate=[NSDate date];
            NSCalendar *gregCalendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];

            NSDateComponents *components=[gregCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit fromDate:currDate];
            NSString *timestamp = [NSString stringWithFormat:@"%d",components.month];
            timestamp = [timestamp stringByAppendingString:[NSString stringWithFormat:@"%d",components.year]];
            [userPhoto setObject:timestamp forKey:@"timestamp"];
            
            [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else{
            [HUD hide:YES];
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    } progressBlock:^(int percentDone) {
        // Update your progress spinner here. percentDone will be between 0 and 100.
        HUD.progress = (float)percentDone/100;
    }];
     */
}

- (void)autograph:(T1Autograph *)autograph didCompleteWithSignature:(T1Signature *)signature {
    // HACK: Close self
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
