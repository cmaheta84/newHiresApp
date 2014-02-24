//
//  ViewPageViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 1/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    CGRect frame1 = CGRectMake(10, 10, self.view.frame.size.height/2-20, self.view.frame.size.width/2-40);
    UIWebView *videoView1 = [[UIWebView alloc] initWithFrame:frame1];
    NSString *html = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/1yAmelDutlc\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",frame1.size.width,frame1.size.height];
    [videoView1 loadHTMLString:html baseURL:nil];
    [self.view addSubview:videoView1];
    
    CGRect frame2 = CGRectMake(self.view.frame.size.height/2, self.view.frame.size.width/2-20, self.view.frame.size.height/2-20, self.view.frame.size.width/2-40);
    UIWebView *videoView2 = [[UIWebView alloc] initWithFrame:frame2];
    NSString *html2 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/ezrkdKlh3xY\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",frame2.size.width,frame2.size.height];
    [videoView2 loadHTMLString:html2 baseURL:nil];
    [self.view addSubview:videoView2];
    
    CGRect frame3 = CGRectMake(10, self.view.frame.size.width/2-20, self.view.frame.size.height/2-20, self.view.frame.size.width/2-40);
    UIWebView *videoView3 = [[UIWebView alloc] initWithFrame:frame3];
    NSString *html3 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/VReKcdk56tU\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",frame3.size.width,frame3.size.height];
    [videoView3 loadHTMLString:html3 baseURL:nil];
    [self.view addSubview:videoView3];
    
    CGRect frame4 = CGRectMake(self.view.frame.size.height/2, 10, self.view.frame.size.height/2-20, self.view.frame.size.width/2-40);
    UIWebView *videoView4 = [[UIWebView alloc] initWithFrame:frame4];
    NSString *html4 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/TkcqO7d3_08\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",frame4.size.width,frame4.size.height];
    [videoView4 loadHTMLString:html4 baseURL:nil];
    [self.view addSubview:videoView4];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
