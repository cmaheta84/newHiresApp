//
//  ContentViewController.m
//  newHiresApp
//
//  Created by Ben Chen on 2/24/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

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
    
    self.nameLabel.text = self.nameText;
    self.dykLabel.text = self.dykText;
    self.factLabel1.text = self.factTexts[0];
    self.factLabel2.text = self.factTexts[1];
    self.factLabel3.text = self.factTexts[2];
    self.factLabel4.text = self.factTexts[3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
