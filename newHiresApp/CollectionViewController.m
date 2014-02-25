//
//  CollectionViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 2/25/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "CollectionViewController.h"
#import "PhotoDetailViewController.h"
#import "SocialDetailsViewController.h"

@interface CollectionViewController ()

@property MBProgressHUD *HUD;
@property MBProgressHUD *refreshHUD;

@property (strong, nonatomic) NSArray *recipeImages;

@end

@implementation CollectionViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CollectionCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *personImageView = (UIImageView *)[cell viewWithTag:100];
    UIImage *image;
    int r = indexPath.row % 3;
    switch (r) {
        case 0:
            image = [UIImage imageNamed:@"Sunflowers.jpg"];
            break;
        case 1:
            image = [UIImage imageNamed:@"Crowd.jpg"];
            break;
        case 2:
            image = [UIImage imageNamed:@"Desert.jpg"];
            break;
        case 3:
            image = [UIImage imageNamed:@"Lime.jpg"];
            break;
        default:
            break;
    }
    personImageView.image = image;
    
    UILabel *personName = (UILabel *)[cell viewWithTag:200];
    NSString *name;
    int r2 = indexPath.row % 4;
    switch (r2) {
        case 0:
            name = @"Ben Chen";
            break;
        case 1:
            name = @"Chandni Maheta";
            break;
        case 2:
            name = @"Marissa Mayer";
            break;
        case 3:
            name = @"Jony Ive";
            break;
        default:
            break;
    }
    personName.text = name;
    
    UILabel *personCaption = (UILabel *)[cell viewWithTag:300];
    NSString *caption;
    int r3 = indexPath.row % 4;
    switch (r3) {
        case 0:
            caption = @"Android Developer";
            break;
        case 1:
            caption = @"iOS Developer";
            break;
        case 2:
            caption = @"CEO";
            break;
        case 3:
            caption = @"Designer";
            break;
        default:
            break;
    }
    personCaption.text = caption;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%i", indexPath.section + 1];
//        headerView.title.text = title;
//        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
//        headerView.backgroundImage.image = headerImage;
        
        reusableview = headerView;
    }
    
    return reusableview;
}

- (IBAction)cameraPressed:(id)sender {
    // Check for camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Show image picker
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else{
        
        // Device has no camera
        UIImage *image;
        int r = arc4random() % 4;
        switch (r) {
            case 0:
                image = [UIImage imageNamed:@"Sunflowers.jpg"];
                break;
            case 1:
                image = [UIImage imageNamed:@"Crowd.jpg"];
                break;
            case 2:
                image = [UIImage imageNamed:@"Desert.jpg"];
                break;
            case 3:
                image = [UIImage imageNamed:@"Lime.jpg"];
                break;
            default:
                break;
        }
        
        // Resize image
//        UIGraphicsBeginImageContext(CGSizeMake(640, 960));
//        [image drawInRect: CGRectMake(0, 0, 640, 960)];
//        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.95f);
        [self uploadImage:imageData];
    }
}

- (IBAction)refreshPressed:(id)sender {
    /*
    NSLog(@"Showing Refresh HUD");
    self.refreshHUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:self.refreshHUD];
	
    // Register for HUD callbacks so we can remove it from the window at the right time
    self.refreshHUD.delegate = self;
	
    // Show the HUD while the provided method executes in a new thread
    [self.refreshHUD show:YES];
    
    PFQuery *query = [PFQuery queryWithClassName:@"UserPhoto"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query orderByAscending:@"createdAt"];
    NSDate *currDate=[NSDate date];
    NSCalendar *gregCalendar=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components=[gregCalendar components:NSMonthCalendarUnit|NSYearCalendarUnit fromDate:currDate];
    NSString *timestamp = [NSString stringWithFormat:@"%d",components.month];
    timestamp = [timestamp stringByAppendingString:[NSString stringWithFormat:@"%d",components.year]];
    [query whereKey:@"timestamp" equalTo:timestamp ];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            if (self.refreshHUD) {
                [self.refreshHUD hide:YES];
                
                self.refreshHUD = [[MBProgressHUD alloc] initWithView:self.view];
                [self.view addSubview:self.refreshHUD];
                
                // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
                // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
                self.refreshHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
                
                // Set custom view mode
                self.refreshHUD.mode = MBProgressHUDModeCustomView;
                
                self.refreshHUD.delegate = self;
            }
            NSLog(@"Successfully retrieved %d photos.", objects.count);
            
            // Retrieve existing objectIDs
            
            NSMutableArray *oldCompareObjectIDArray = [NSMutableArray array];
            for (UIView *view in [photoScrollView subviews]) {
                if ([view isKindOfClass:[UIButton class]]) {
                    UIButton *eachButton = (UIButton *)view;
                    [oldCompareObjectIDArray addObject:[eachButton titleForState:UIControlStateReserved]];
                }
            }
            
            NSMutableArray *oldCompareObjectIDArray2 = [NSMutableArray arrayWithArray:oldCompareObjectIDArray];
            
            // If there are photos, we start extracting the data
            // Save a list of object IDs while extracting this data
            
            NSMutableArray *newObjectIDArray = [NSMutableArray array];
            if (objects.count > 0) {
                for (PFObject *eachObject in objects) {
                    [newObjectIDArray addObject:[eachObject objectId]];
                }
            }
            
            // Compare the old and new object IDs
            NSMutableArray *newCompareObjectIDArray = [NSMutableArray arrayWithArray:newObjectIDArray];
            NSMutableArray *newCompareObjectIDArray2 = [NSMutableArray arrayWithArray:newObjectIDArray];
            if (oldCompareObjectIDArray.count > 0) {
                // New objects
                [newCompareObjectIDArray removeObjectsInArray:oldCompareObjectIDArray];
                // Remove old objects if you delete them using the web browser
                [oldCompareObjectIDArray removeObjectsInArray:newCompareObjectIDArray2];
                if (oldCompareObjectIDArray.count > 0) {
                    // Check the position in the objectIDArray and remove
                    NSMutableArray *listOfToRemove = [[NSMutableArray alloc] init];
                    for (NSString *objectID in oldCompareObjectIDArray){
                        int i = 0;
                        for (NSString *oldObjectID in oldCompareObjectIDArray2){
                            if ([objectID isEqualToString:oldObjectID]) {
                                // Make list of all that you want to remove and remove at the end
                                [listOfToRemove addObject:[NSNumber numberWithInt:i]];
                            }
                            i++;
                        }
                    }
                    
                    // Remove from the back
                    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
                    [listOfToRemove sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
                    
                    for (NSNumber *index in listOfToRemove){
                        [allPeople removeObjectAtIndex:[index intValue]];
                    }
                }
            }
            
            // Add new objects
            for (NSString *objectID in newCompareObjectIDArray){
                for (PFObject *eachObject in objects){
                    if ([[eachObject objectId] isEqualToString:objectID]) {
                        NSMutableArray *selectedPhotoArray = [[NSMutableArray alloc] init];
                        [selectedPhotoArray addObject:eachObject];
                        
                        if (selectedPhotoArray.count > 0) {
                            [allPeople addObjectsFromArray:selectedPhotoArray];
                        }
                    }
                }
            }
            
            // Remove and add from objects before this
            [self setUpImages:allPeople];
            
        } else {
            [self.refreshHUD hide:YES];
            
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
     */
}

- (void)uploadImage:(NSData *)imageData
{
    //PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    SocialDetailsViewController *socialDetailVC = [[SocialDetailsViewController alloc] init];
    socialDetailVC.imagedata = imageData;
    [self.tabBarController presentViewController:socialDetailVC animated:YES completion:nil];
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD hides
    [self.HUD removeFromSuperview];
	self.HUD = nil;
}

#pragma mark UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Dismiss controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.05f);
    [self uploadImage:imageData];
}

@end
