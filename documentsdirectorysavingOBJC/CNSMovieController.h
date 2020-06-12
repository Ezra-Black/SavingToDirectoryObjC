//
//  CNSMovieController.h
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNSMovieController : NSObject

//MARK: - Properties

@property(nonatomic) NSArray *ArrayWithMoviesFromDictionary;



//MARK: - Methods

-(void)addMovieToArrayWithTitle:(NSString *)title rating:(NSString *)rating;

@end

NS_ASSUME_NONNULL_END
