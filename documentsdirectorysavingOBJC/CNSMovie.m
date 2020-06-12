//
//  CNSMovie.m
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSMovie.h"

@implementation CNSMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating
{
    self = [super init];
    if(self) {
        _title = title;
        _rating = rating;
    }
    return self;
}

@end
