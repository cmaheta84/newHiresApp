//
//  TimelineViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 1/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "TimelineViewController.h"
#import "TimelineItem.h"

@interface TimelineViewController ()
@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *images;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (strong, nonatomic) NSDateFormatter *dateFormat;
//@property (strong, nonatomic) CATransition *transitionAnimation;

@end

@implementation TimelineViewController

- (void)setUp
{
    // Initialize
    self.dateFormat = [[NSDateFormatter alloc] init];
    [self.dateFormat setDateFormat:@"MMM d, YYYY"];
    
    /*
    self.transitionAnimation = [CATransition animation];
    [self.transitionAnimation setType:kCATransitionFade];
    [self.transitionAnimation setDuration:0.3f];
    [self.transitionAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.transitionAnimation setFillMode:kCAFillModeBoth];
     */
    
    //Parse JSON and store an array of TimelineItems
    NSData *timelineData = [[NSData alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"History" withExtension:@"json"]];
    NSError *error;
    NSDictionary *timelineDict = [NSJSONSerialization
                                  JSONObjectWithData:timelineData
                                  options:NSJSONReadingMutableContainers
                                  error:&error];
    self.items = [NSMutableArray array];
    NSArray *array = [timelineDict objectForKey:@"items"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        TimelineItem *timelineItem = [[TimelineItem alloc] initWithJSONDictionary:dict];
        [self.items addObject:timelineItem];
    }
    
    //NSLog(@"%@", self.items);
    
    // Set up images
    NSArray *PhotoArray = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"TimelinePhotos/."];
    self.images = [[NSMutableArray alloc] initWithCapacity:PhotoArray.count];
    for (NSString* path in PhotoArray) {
        [self.images addObject:[UIImage imageWithContentsOfFile:path]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)viewDidLoad
{
    [self setUp];
    self.carousel.type = iCarouselTypeInvertedTimeMachine;
    [self.carousel reloadData];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iCarousel Methods

-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.images.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view{
    //    UILabel *label = nil;
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300.0f, 300.0f)];
    ((UIImageView *)view).image = [self.images objectAtIndex:index];
    view.contentMode = UIViewContentModeScaleAspectFit;
    //    label = [[UILabel alloc] initWithFrame:view.bounds];
    //    label.backgroundColor = [UIColor clearColor];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.font = [label.font fontWithSize:50];
    //    label.tag = 1;
    //    [view addSubview:label];
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    
    //    label.text = [self.items[index] stringValue];
    
    return view;
}

-(CGFloat)carouselItemWidth:(iCarousel *)carousel {
    return 300;
}

-(void)carouselDidScroll:(iCarousel *)carousel {
    if (carousel.currentItemIndex < self.items.count){
        TimelineItem *item = self.items[carousel.currentItemIndex];

        //[self.dateLabel.layer addAnimation:self.transitionAnimation forKey:@"fadeAnimation"];
        [self.dateLabel setText:[self.dateFormat stringFromDate:item.date]];
        //[self.eventLabel.layer addAnimation:self.transitionAnimation forKey:@"fadeAnimation"];
        [self.eventLabel setText:item.title];
        //[self.description.layer addAnimation:self.transitionAnimation forKey:@"fadeAnimation"];
        [self.description setText:item.description];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionTilt:
        {
            return value * 2.4;
        }
        case iCarouselOptionSpacing:
        {
            return value;
        }
        default:
        {
            return value;
        }
    }
}

@end
