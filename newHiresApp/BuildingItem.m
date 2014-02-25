//
//  BuildingItem.m
//  newHiresApp
//
//  Created by Ben Chen on 2/24/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import "BuildingItem.h"

@implementation BuildingItem

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _id = [jsonDictionary objectForKey:@"id"];
        _imageId = [jsonDictionary objectForKey:@"imageId"];
        _name = [jsonDictionary objectForKey:@"name"];
        _facts = [jsonDictionary objectForKey:@"facts"];
        _dyk = [jsonDictionary objectForKey:@"dyk"];
    }
    return self;
}

@end
