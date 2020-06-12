//
//  main.m
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNSMovieController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Beginning Program");
        CNSMovieController *movieController = [[CNSMovieController alloc]init];
        NSString *title = @"Alien";
        NSString *rating = @"R";
        [movieController addMovieToArrayWithTitle:title rating:rating];
        NSLog(@"%@", movieController.ArrayWithMoviesFromDictionary);
    }
    return 0;
}
