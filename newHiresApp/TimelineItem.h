//
//  TimelineItem.h
//  newHiresApp
//
//  Created by Ben Chen on 2/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimelineItem : NSObject

@property (nonatomic, strong) NSData *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *imageUrl;

@end
