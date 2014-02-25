//
//  ContentViewController.h
//  newHiresApp
//
//  Created by Ben Chen on 2/24/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *dykLabel;
@property (weak, nonatomic) IBOutlet UILabel *factLabel1;
@property (weak, nonatomic) IBOutlet UILabel *factLabel2;
@property (weak, nonatomic) IBOutlet UILabel *factLabel3;
@property (weak, nonatomic) IBOutlet UILabel *factLabel4;
@property (nonatomic) NSUInteger pageIndex;
@property (weak, nonatomic) NSString *nameText;
@property (weak, nonatomic) NSString *dykText;
@property (weak, nonatomic) NSMutableArray *factTexts;

@end
