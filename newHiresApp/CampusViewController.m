//
//  CampusPageViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 1/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "CampusViewController.h"
#import <MapKit/MKMapView.h>
#import <MapKit/MKAnnotation.h>
#import "BuildingItem.h"

@interface CampusViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *buildingImageView;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (assign, nonatomic) NSInteger selectedBuilding;
@property (strong, nonatomic) NSMutableArray *buildings;
@property (strong, nonatomic) NSMutableArray *markers;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic) NSUInteger pageIndex;
@property (nonatomic) NSUInteger lastPageIndex;

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view;

@end

@implementation CampusViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setUp {
    self.buildings = [[NSMutableArray alloc] init];
    
    //Parse JSON and store an array of TimelineItems
    NSData *timelineData = [[NSData alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Buildings" withExtension:@"json"]];
    NSError *error;
    NSDictionary *timelineDict = [NSJSONSerialization
                                  JSONObjectWithData:timelineData
                                  options:NSJSONReadingMutableContainers
                                  error:&error];
    self.buildings = [NSMutableArray array];
    NSArray *array = [timelineDict objectForKey:@"buildings"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        BuildingItem *buildingItem = [[BuildingItem alloc] initWithJSONDictionary:dict];
        [self.buildings addObject:buildingItem];
    }
    
    // Load first building
    UIImage *imageBuild = [UIImage imageNamed:@"BuildingPhotos/Campus.jpg"];
    [self.buildingImageView setImage:imageBuild];
    
    self.lastPageIndex = 0;
}

- (void)viewDidLoad {
    [self setUp];
    [self loadMap];
    
    [super viewDidLoad];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60);
    
    [self addChildViewController:_pageViewController];
    [self.view insertSubview:_pageViewController.view belowSubview:self.mapView];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark MapView Methods

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    NSString *imageDirectory = @"BuildingPhotos/";
    NSString *imageName = @"_Building.jpg";
    NSUInteger index = 0;
    imageName = [imageDirectory stringByAppendingString:[view.annotation.title stringByAppendingString:imageName]];
    if([view.annotation.title isEqualToString:@"A"]) {
        index = 1;
    } else if([view.annotation.title isEqualToString:@"B"]) {
        index = 2;
    } else if([view.annotation.title isEqualToString:@"C"]) {
        index = 3;
    } else if([view.annotation.title isEqualToString:@"D"]) {
        index = 4;
    } else if([view.annotation.title isEqualToString:@"E"]) {
        index = 5;
    } else if([view.annotation.title isEqualToString:@"F"]) {
        index = 6;
    } else if([view.annotation.title isEqualToString:@"G"]) {
        index = 7;
    } else {
        NSLog(@"ERROR: Invalid Building");
    }

    PageContentViewController *startingViewController = [self viewControllerAtIndex:index];
    NSArray *viewControllers = @[startingViewController];
    if (self.pageIndex < self.lastPageIndex) {
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    } else {
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    self.lastPageIndex = self.pageIndex;
    [self updateBackgroundImage:self.pageIndex];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mapPin"];
    if (!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                 reuseIdentifier:@"mapPin"];
    
        aView.annotation = annotation;
    }
    NSString *imageFileName = [annotation.title stringByAppendingString:@"_Marker"];
    aView.image = [UIImage imageNamed:imageFileName];

    return aView;
}

- (void)loadMap {
    self.mapView.delegate = self;
    self.markers = [NSMutableArray array];
    
    MKCoordinateRegion zoomRegion;
    zoomRegion.center.latitude = 37.4169;
    zoomRegion.center.longitude = -122.024509;
    zoomRegion.span.latitudeDelta = 0.005;
    zoomRegion.span.longitudeDelta = 0.005;
    [_mapView setRegion:zoomRegion animated:YES];
    
    MKCoordinateRegion regionA;
    regionA.center.latitude = 37.417499;
    regionA.center.longitude = -122.0260;
    MKPointAnnotation *ann4 = [[MKPointAnnotation alloc] init];
    ann4.coordinate = regionA.center;
    ann4.title = @"A";
    [_mapView addAnnotation:ann4];
    [self.markers addObject:ann4];
    
    MKCoordinateRegion regionB;
    regionB.center.latitude = 37.418499;
    regionB.center.longitude = -122.025659;
    MKPointAnnotation *ann2 = [[MKPointAnnotation alloc] init];
    ann2.coordinate = regionB.center;
    ann2.title = @"B";
    [_mapView addAnnotation:ann2];
    [self.markers addObject:ann2];
    
    MKCoordinateRegion regionC;
    regionC.center.latitude = 37.418499;
    regionC.center.longitude = -122.024459;
    MKPointAnnotation *ann1 = [[MKPointAnnotation alloc] init];
    ann1.coordinate = regionC.center;
    ann1.title = @"C";
    [_mapView addAnnotation:ann1];
    [self.markers addObject:ann1];
	
    MKCoordinateRegion regionD;
    regionD.center.latitude = 37.417499;
    regionD.center.longitude = -122.0250;
    MKPointAnnotation *ann3 = [[MKPointAnnotation alloc] init];
    ann3.coordinate = regionD.center;
    ann3.title = @"D";
    [_mapView addAnnotation:ann3];
    [self.markers addObject:ann3];
    
    MKCoordinateRegion regionE;
    regionE.center.latitude = 37.416;
    regionE.center.longitude = -122.0255;
    MKPointAnnotation *ann5 = [[MKPointAnnotation alloc] init];
    ann5.coordinate = regionE.center;
    ann5.title = @"E";
    [_mapView addAnnotation:ann5];
    [self.markers addObject:ann5];
    
    MKCoordinateRegion regionF;
    regionF.center.latitude = 37.4155;
    regionF.center.longitude = -122.023961;
    MKPointAnnotation *ann7 = [[MKPointAnnotation alloc] init];
    ann7.coordinate = regionF.center;
    ann7.title = @"F";
    [_mapView addAnnotation:ann7];
    [self.markers addObject:ann7];
    
    MKCoordinateRegion regionG;
    regionG.center.latitude = 37.4147;
    regionG.center.longitude = -122.0242;
    MKPointAnnotation *ann6 = [[MKPointAnnotation alloc] init];
    ann6.coordinate = regionG.center;
    ann6.title = @"G";
    [_mapView addAnnotation:ann6];
    [self.markers addObject:ann6];
}

#pragma mark - PageViewController Methods

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.buildings count] == 0) || (index >= [self.buildings count])) {
        return nil;
    }
    
    self.pageIndex = index; //NOTE: THIS IS NOT ALWAYS CORRECT! FIX THIS ASAP
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentViewController.factTexts = [NSMutableArray array];
    
    BuildingItem *buildling = self.buildings[index];
    contentViewController.nameText = buildling.name;
    contentViewController.factTexts[0] = buildling.facts[0];
    contentViewController.factTexts[1] = buildling.facts[1];
    contentViewController.factTexts[2] = buildling.facts[2];
    contentViewController.factTexts[3] = buildling.facts[3];
    contentViewController.dykText = buildling.dyk;
    
    contentViewController.pageIndex = index;
    
    return contentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index >= [self.buildings count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.buildings count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (void)pageViewController:(UIPageViewController *)pvc didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    // If the page did not turn
    if (!completed)
    {
        // You do nothing because whatever page you thought
        // the book was on before the gesture started is still the correct page
        return;
    }

    if (self.pageIndex >= self.buildings.count){
        return;
    }
    [self updateBackgroundImage:index];
}

- (void)updateBackgroundImage:(NSUInteger)index {
    BuildingItem *buildling = self.buildings[self.pageIndex];
    NSString *imageName = [[@"BuildingPhotos/" stringByAppendingString:buildling.imageId] stringByAppendingString:@".jpg"];
    
    // Transition to new image with a smooth fade animation
    UIImage * toImage = [UIImage imageNamed:imageName];
    [UIView transitionWithView:self.buildingImageView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.buildingImageView.image = toImage;
                    } completion:nil];
}

@end
