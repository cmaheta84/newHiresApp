//
//  HomeViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 1/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *slideshowImageView;
@property (atomic) int lastPictureIndex;

@end

@implementation HomeViewController

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
    
    // Slideshow
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    self.lastPictureIndex = 0;

//    UIImage *image = [UIImage imageNamed:@"BuildingPhotos/Campus.jpg"];
//    [self.slideshowImageView setImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTimer
{
    int r = arc4random() % 32;
    while (r == self.lastPictureIndex) { // Prevent transitioning to same image again
        r = arc4random() & 32;
    }
    
    NSString *imageName = @"";
    imageName = [imageName stringByAppendingFormat:@"CampusPhotos/%d.jpg",r];
    
    // Transition to new image with a smooth fade animation
    UIImage * toImage = [UIImage imageNamed:imageName];
    [UIView transitionWithView:self.slideshowImageView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.slideshowImageView.image = toImage;
                    } completion:nil];
}

@end
