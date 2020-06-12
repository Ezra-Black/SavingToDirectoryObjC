//
//  CNSMovie+CNSJsonSerialization.h
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface CNSMovie (CNSJsonSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)returnedDictionarytoSave;

@end

NS_ASSUME_NONNULL_END
