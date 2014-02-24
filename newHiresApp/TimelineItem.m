//
//  TimelineItem.m
//  newHiresApp
//
//  Created by Ben Chen on 2/23/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "TimelineItem.h"

@implementation TimelineItem

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _title = [jsonDictionary objectForKey:@"title"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        _date = [dateFormatter dateFromString:[jsonDictionary objectForKey:@"date"]];
        
        _description = [jsonDictionary objectForKey:@"description"];
        _imageId = [jsonDictionary objectForKey:@"imageId"];
    }
    
    return self;
}

@end
