//
//  CNSMovie+CNSJsonSerialization.m
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSMovie+CNSJsonSerialization.h"

@implementation CNSMovie (CNSJsonSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *rating = dictionary[@"rating"];
    
    return [self initWithTitle:title rating:rating];
}

- (NSDictionary *)returnedDictionarytoSave
{
    return @{@"title": [self title],
             @"rating": [self rating]
    };
}



@end
