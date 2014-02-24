//
//  TimelineItem.h
//  newHiresApp
//
//  Created by Ben Chen on 2/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimelineItem : NSObject

@property (readonly) NSString *title;
@property (readonly) NSDate *date;
@property (readonly) NSString *description;
@property (readonly) NSNumber *imageId;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
