//
//  BuildingItem.h
//  newHiresApp
//
//  Created by Ben Chen on 2/24/14.
//  Copyright (c) 2014 Chandni Maheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildingItem : NSObject

@property (readonly) NSString *id;
@property (readonly) NSString *imageId;
@property (readonly) NSString *name;
@property (readonly) NSArray *facts;
@property (readonly) NSString *dyk;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
