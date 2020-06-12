//
//  CNSMovie.h
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNSMovie : NSObject

// MARK: - Properties

@property NSString *title;
@property NSString *rating;

//MARK: - Initializers

- (instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating;
//- (instancetype)initFromDictionary:(NSDictionary *)disctionary;
@end

NS_ASSUME_NONNULL_END
