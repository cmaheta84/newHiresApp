//
//  ViewPageViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 1/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *videoView1;
@property (weak, nonatomic) IBOutlet UIWebView *videoView2;
@property (weak, nonatomic) IBOutlet UIWebView *videoView3;
@property (weak, nonatomic) IBOutlet UIWebView *videoView4;

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
    NSString *html = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/1yAmelDutlc?hd=1\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",self.videoView1.frame.size.width,self.videoView1.frame.size.height];
    [self.videoView1 loadHTMLString:html baseURL:nil];
    self.videoView1.scrollView.scrollEnabled = NO;
   
    NSString *html2 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/ezrkdKlh3xY?hd=1\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",self.videoView2.frame.size.width,self.videoView2.frame.size.height];
    [self.videoView2 loadHTMLString:html2 baseURL:nil];
    self.videoView2.scrollView.scrollEnabled = NO;
    
    NSString *html3 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/VReKcdk56tU?hd=1\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",self.videoView3.frame.size.width,self.videoView3.frame.size.height];
    [self.videoView3 loadHTMLString:html3 baseURL:nil];
    self.videoView3.scrollView.scrollEnabled = NO;
    
    NSString *html4 = [NSString stringWithFormat:@"<html><body><iframe class=\"youtube-player\" type=\"text/html\" width=\"%f\" height=\"%f\" src=\"http://www.youtube.com/embed/TkcqO7d3_08?hd=1\" allowfullscreen frameborder=\"0\" rel=nofollow></iframe></body></html>",self.videoView4.frame.size.width,self.videoView4.frame.size.height];
    [self.videoView4 loadHTMLString:html4 baseURL:nil];
    self.videoView4.scrollView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
