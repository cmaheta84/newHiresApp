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

@interface CampusViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (strong, nonatomic) IBOutlet UIImageView *buildingImageView;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (assign, nonatomic) NSInteger selectedBuilding;
@property (strong, nonatomic) NSMutableArray *downLabelList;
@property (strong, nonatomic) NSMutableArray *rightLabelList;
- (IBAction)onReset:(id)sender;
- (IBAction)onZoomOut:(id)sender;
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

- (void) fillUpData
{
    NSString *labelB = [[[[[@"Building B\n" stringByAppendingString:@"Sports Studio -- first floor\n" ] stringByAppendingFormat:@"One of our three studios.  The other two are in Santa Monica (Entertainment)  and New York (Finance)\n"]stringByAppendingFormat:@"Sports Talk Live (taped in this studio) airs every weeknight on Comcast SportsNet Bay Area.\n"] stringByAppendingFormat:@"The posters in the hallways are shows new & old in SM, NY and SNV.June 4th we hosted Vernon Davis (49ers player) on campus for a live show.\n"] stringByAppendingFormat:@"B3 is where the Ergo Lab is located."];
    
    [self.rightLabelList addObject:labelB];
    
    NSString *labelDYKb = @"The lawn and patio areas are used for a variety of events including Music on the Greens (kick-off to summer, Picnic), departmental parties and other employee events.The campus was designed by RMW, who also designed the buildings for e-Bay, Lucas Arts, and the NYSE Palo Alto building.Every building has art in front of it.";
    [self.downLabelList addObject:labelDYKb];
    
    NSString *labelC = [[[[@"Building C\n" stringByAppendingString:@"URL's Seats 500 people and serves about 1,800 people each day.  It is the location for the FYI (For Yahoos Information) meeting every Friday, Marissa rarely misses the meeting (only twice so far).\n"]stringByAppendingFormat:@"John Lennon Painting Painted with bare hands in 6 minutes by an artist at a Y! Year End Party, then purchased for charity by one of our founders, David Filo.\n"] stringByAppendingFormat:@"3D painting between URL’s and the game room/coffee bar.  Created live on campus by 3 artists in honor of Yahoo!’s 15th birthday."]stringByAppendingFormat:@"3D glasses are located behind the informational stand to the far left.At this event the band Collective Soul performed."];
    
    [self.rightLabelList addObject:labelC];
    
    NSString *labelDYKc = [@"Building C has Game Tables,Y!Mart (Lori the manager will let you know of the discounts - AMC movie tickets, Monterey Bar Aquarium, Universal Studios and much more) and Fitness Center.\n" stringByAppendingFormat:@"The gym is open 24/7, and in addition to the workout equipment offers massage, sauna and specialized classes. More than 250 Yahoos use the Fitness Center each day."];
    [self.downLabelList addObject:labelDYKc];
    
    NSString *labelD = [[@"Building D\n" stringByAppendingString:@"The Wind Cube (Y! Campus Art, produced by Ned Kahn, an outside artist) - Bldg D Entrance.  As air currents pass through the cube, the 3-D structure of the wind is made visible. His intention was to create an artwork that will always be changing as it responds to the local environmental conditions.\n" ] stringByAppendingFormat:@"Yahoo!’s entire headquarters campus has been awarded LEED ® Gold certification under the US Green Building Council’s standards for Existing Buildings: Operations + Maintenance.  Yahoo! was further honored to receive the first LEED ® Gold designation ever given to a multi-building office campus under this standard. Show gold & green on doors when walking in."];

    [self.rightLabelList addObject:labelD];
    
    NSString *labelDYKd = @"Yahoo! Company Store (D1 Lobby) - Bring your guests by the store to get their hands on Yahoo! merchandise.You’ll also find the ‘never ending’ gumball machine out in front of the store (one of Marissa’s guilty pleasures).Behind building C we have basketball, volleyball, and bocce ball courts. 9/11 Memorial & Gretchen's Garden Rock - Behind the volleyball court";
    [self.downLabelList addObject:labelDYKd];
    
    NSString *labelE = [@"Building E\n"stringByAppendingString:@"Labyrinth Doors (Yahoo! Campus Art) - Bldg E Front Lawn Five portals have been arranged as a labyrinth without path or boundary.E3 is where the Accessibility Lab is located."];
    [self.rightLabelList addObject:labelE];
    
    NSString *labelDYKe = @"When Jerry and David started compiling their web directory in early 1994, it was called Jerry and David's Guide to the World Wide Web. As the site became more popular, they decided it needed a shorter, catchier name. They agreed that the first two letters should be YA because the names of several software tools they had used as computer science students began with those letters.";
    [self.downLabelList addObject:labelDYKe];
    
    NSString *labelF = [@"Building F\n" stringByAppendingString:@"Yahoo's Search team is located in Building F. The cafeteria at F has chinese noodeles and chinese items in menu each day. So, if you are fan of chinese food, try F cafeteria."];
    [self.rightLabelList addObject:labelF];
    
    NSString *labelDYKf = [[@"Why purple?\n" stringByAppendingFormat:@"The rumor/funnier version is that David Filo is cheap and picked the cheapest paint color available to paint their first office, which was purple.\n"] stringByAppendingFormat:@"The real reason is Jerry and David had a friend design the first Yahoo! logo for them and they chose purple, yellow and blue as the primary colors for it.  The blue didn’t last."];
    [self.downLabelList addObject:labelDYKf];
    
    NSString *labelG = [@"Building G\n"stringByAppendingString:@"Yahoo's Web Search team is located in building G. The cafeteria of G has maxican menu each day. You will love to try maxican burrito at build G."];
    [self.rightLabelList addObject:labelG];
    
    NSString *labelDYKg = @"Yahoo! holds 1,500 patents and has 2,500 pending. Each floor of each building has a different \"theme\" for conference room names.All Sunnyvale buildings have a coffee bar. Yahoos in Sunnyvale drink approximately 3,000 coffee drinks each day.";
    [self.downLabelList addObject:labelDYKg];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed: 75.0/255.0f green:0.0/255.0f blue:130.0/255.0f alpha:1.0];
    self.selectedBuilding = 1;
    NSString *label = [@"Building A\n" stringByAppendingString:@"A2 – Design team for Yahoo! Homepage (editorial and engineering).\n Theme is News room. \n"];
    label = [label stringByAppendingString:@"Photos are loosely inspired by Yahoo! Trending Now and Yahoo! Slideshows. They represent a sampling of news events since the death of Jerry Garcia, which was the first news story Yahoo! linked to in 1995.\n"];
    label = [label stringByAppendingString:@"The Editorial team, led by Jai Singh, opted for photos of the events/stories that aren’t too morbid.  I.e. flowers left at Kensington Place vs. the mangled Mercedes in Paris to represent Princess Diana’s death in 1997.\n"];
    self.rightLabelList = [[NSMutableArray alloc] init];
    self.downLabelList = [[NSMutableArray alloc] init];
    [self.rightLabelList addObject:@""];
    [self.rightLabelList addObject:label];
    
    NSString *labelDYK = @"Yahoo! started construction of the campus in 2000, and moved in June, 2001. The campus has 977,639 square feet which accommodates ~4,000 employees (FTE & Contract).There are approximately 13,000 employees (FTE) worldwide.";
    [self.downLabelList addObject:@""];
    [self.downLabelList addObject:labelDYK];
    [self fillUpData];
    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    [self.mainImageView setImage:image];
    
    UIImage *imageBuild = [UIImage imageNamed:@"1B.jpg"];
    [self.buildingImageView setImage:imageBuild];
    self.downLabel.text = labelDYK;
    self.downLabel.font = [UIFont boldSystemFontOfSize:14];
    self.downLabel.textColor = [UIColor colorWithRed: 147.0/255.0f green:112.0/255.0f blue:219.0/255.0f alpha:1.0];
    self.rightLabel.text = label;
    self.rightLabel.font = [UIFont boldSystemFontOfSize:18];
    self.rightLabel.textColor = [UIColor colorWithRed: 147.0/255.0f green:112.0/255.0f blue:219.0/255.0f alpha:1.0];
    
    _mapView.showsUserLocation = YES;
    _mapView.zoomEnabled = YES;
    self.mapView.delegate = self;
    MKCoordinateRegion region;
    region.center.latitude = 37.4172;
    region.center.longitude = -122.025459;
    region.span.latitudeDelta = 0.005;
    region.span.longitudeDelta = 0.005;
    [_mapView setRegion:region animated:YES];
    
    MKCoordinateRegion region1;
    region1.center.latitude = 37.418599;
    region1.center.longitude = -122.024459;
    MKPointAnnotation *ann1 = [[MKPointAnnotation alloc] init];
    ann1.coordinate = region1.center;
    ann1.title = @"BuildingA";
    [_mapView addAnnotation:ann1];
	
    MKCoordinateRegion region2;
    region2.center.latitude = 37.418599;
    region2.center.longitude = -122.025959;
    MKPointAnnotation *ann2 = [[MKPointAnnotation alloc] init];
    ann2.coordinate = region2.center;
    ann2.title = @"BuildingB";
    [_mapView addAnnotation:ann2];
    
    MKCoordinateRegion region3;
    region3.center.latitude = 37.417599;
    region3.center.longitude = -122.0250;
    MKPointAnnotation *ann3 = [[MKPointAnnotation alloc] init];
    ann3.coordinate = region3.center;
    ann3.title = @"BuildingC";
    [_mapView addAnnotation:ann3];
    
    MKCoordinateRegion region4;
    region4.center.latitude = 37.417599;
    region4.center.longitude = -122.0260;
    MKPointAnnotation *ann4 = [[MKPointAnnotation alloc] init];
    ann4.coordinate = region4.center;
    ann4.title = @"BuildingD";
    [_mapView addAnnotation:ann4];
    
    MKCoordinateRegion region5;
    region5.center.latitude = 37.416581;
    region5.center.longitude = -122.0265;
    MKPointAnnotation *ann5 = [[MKPointAnnotation alloc] init];
    ann5.coordinate = region5.center;
    ann5.title = @"BuildingE";
    [_mapView addAnnotation:ann5];
    
    /*F and G*/
    MKCoordinateRegion region6;
    region6.center.latitude = 37.415;
    region6.center.longitude = -122.023961;
    MKPointAnnotation *ann6 = [[MKPointAnnotation alloc] init];
    ann6.coordinate = region6.center;
    ann6.title = @"BuildingF";
    [_mapView addAnnotation:ann6];
    
    MKCoordinateRegion region7;
    region7.center.latitude = 37.416;
    region7.center.longitude = -122.023961;
    MKPointAnnotation *ann7 = [[MKPointAnnotation alloc] init];
    ann7.coordinate = region7.center;
    ann7.title = @"BuildingG";
    [_mapView addAnnotation:ann7];
    [_mapView selectAnnotation:nil animated:NO];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSString *imageName = @"B.jpg";
    imageName = [view.annotation.title stringByAppendingString:imageName];
    if( ([view.annotation coordinate].latitude == 37.416) && ([view.annotation coordinate].longitude ==-122.023961))
    {
        self.rightLabel.text = self.rightLabelList[7];
        self.downLabel.text = self.downLabelList[7];
    }
    else if( ([view.annotation coordinate].latitude == 37.415) && ([view.annotation coordinate].longitude ==-122.023961))
    {
        self.rightLabel.text = self.rightLabelList[6];
        self.downLabel.text = self.downLabelList[6];
    } else if( ([view.annotation coordinate].latitude == 37.416581) && ([view.annotation coordinate].longitude ==-122.0265))
    {
        self.rightLabel.text = self.rightLabelList[5];
        self.downLabel.text = self.downLabelList[5];
    } else if( ([view.annotation coordinate].latitude == 37.417599) && ([view.annotation coordinate].longitude ==-122.0260))
    {
        self.rightLabel.text = self.rightLabelList[4];
        self.downLabel.text = self.downLabelList[4];
    } else if( ([view.annotation coordinate].latitude == 37.417599) && ([view.annotation coordinate].longitude ==-122.0250))
    {
        self.rightLabel.text = self.rightLabelList[3];
        self.downLabel.text = self.downLabelList[3];
    } else if( ([view.annotation coordinate].latitude == 37.418599) && ([view.annotation coordinate].longitude ==-122.025959))
    {
        self.rightLabel.text = self.rightLabelList[2];
        self.downLabel.text = self.downLabelList[2];
    } else {
        self.rightLabel.text = self.rightLabelList[1];
        self.downLabel.text = self.downLabelList[1];
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [self.buildingImageView setImage:image];
    [self.view reloadInputViews];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    NSLog(@"%f",[annotation coordinate].latitude);
    NSLog(@"%f",[annotation coordinate].longitude);
    NSLog(@"%@",annotation.title);
    UIImage *image = [UIImage imageNamed:annotation.title];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mapPin"];
    if (!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                 reuseIdentifier:@"mapPin"];
    
        aView.annotation = annotation;
    }
    [aView addSubview:imageView];
    return aView;
}

- (void)onTimer
{
    int r = arc4random() % 18;
    if(r == 0) r = r+1;
    NSString *imageName = @"";
    imageName = [imageName stringByAppendingFormat:@"%d.jpg",r];
    UIImage *image = [UIImage imageNamed:imageName];
    [self.mainImageView setImage:image];
    [self.view reloadInputViews];
}

- (IBAction)onReset:(id)sender {
}

- (IBAction)onZoomOut:(id)sender {
    
}
@end
