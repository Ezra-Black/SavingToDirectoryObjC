//
//  CNSMovieController.m
//  documentsdirectorysavingOBJC
//
//  Created by Ezra Black on 6/11/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSMovieController.h"
#import "CNSMovie.h"
#import "CNSMovie+CNSJsonSerialization.h"

//this is to declare private properties

@interface CNSMovieController()

@property NSMutableArray *internalMovies;

@end

//---------------------------------------------------------------------------------------------

@implementation CNSMovieController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //makes both pointers compatible with each other.
        _internalMovies = [[self loadMoviesFromController] mutableCopy];
        
    }
    return self;
}

//method that makes a movie and sets up the internal movies array to have the new movie.

//MARK: - CRUD

- (void)addMovieToArrayWithTitle:(NSString *)title rating:(NSString *)rating
{
    CNSMovie *movieToAddToInternalArray = [[CNSMovie alloc]initWithTitle:title rating:rating];
    [self.internalMovies addObject:movieToAddToInternalArray];
    //save to the documents directory!!
    
    [self saveMoviesToDirectory];
}


- (NSArray *)ArrayWithMoviesFromDictionary
{
    return [self internalMovies];
}

// MARK: - methods to save and load to documents directory

//step 1 get/create movie URL
-(NSURL *)createMoviesURL
{
    //get documents URL
    NSURL *instanceOfDocumentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
    //create the name of the file you're going to add
    NSString *fileForMovieURLCreated = @"movies.json";
    //return the URL with file path attached to it!
    return [instanceOfDocumentsDirectoryURL URLByAppendingPathComponent:fileForMovieURLCreated];
}

//step 2 create the callMovies method

-(NSArray *)loadMoviesFromController
{
    //creating my possible errors
    NSError *jsonDataError = nil;
    //get the movies url from our method that creates them
    NSData *movieDataForURL = [NSData dataWithContentsOfURL: [self createMoviesURL]];
    
    //check to make sure we do have a URL
    if(!movieDataForURL)
    {
        return @[];
    }
    
    NSArray *pulledMoviesSavedToDirectory = [NSJSONSerialization JSONObjectWithData:movieDataForURL options:0 error:&jsonDataError];
    if(jsonDataError)
    {
        NSLog(@"Error fetching Movies: %@", jsonDataError);
        return @[];
    }
     NSMutableArray *movies = [[NSMutableArray alloc]init];
    
    //take dictionary data, loop through the arrays that contain them and init a new instance of model so we can return the arrays to internal movies so we can display.
    for(int i = 0; i < pulledMoviesSavedToDirectory.count; i++)
    {
        NSDictionary *movieDictionaryBeingLoopedThrough = pulledMoviesSavedToDirectory[i];
        CNSMovie *movieInDictionaryIndex = [[CNSMovie alloc]initFromDictionary:movieDictionaryBeingLoopedThrough];
        [movies addObject:movieInDictionaryIndex];
    }
    return movies; //take this array and add it to internal movies
}

//step 3 save movies to the directory
-(void)saveMoviesToDirectory
{
    NSError *jsonError = nil;
    NSMutableArray *moviesDictionary = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.internalMovies.count; i++)
    {
        CNSMovie *moviePulledFromArray = self.internalMovies[i];
        [moviesDictionary addObject: [moviePulledFromArray returnedDictionarytoSave]];
    }
    //convert to JSON! takes data and converts it to json
    NSData *movieDataBeingCreated = [NSJSONSerialization dataWithJSONObject:moviesDictionary options:0 error:&jsonError];
    if (jsonError)
    {
        NSLog(@"Error converting movies data into JSON: %@",jsonError);
    }
    
    //save JSON to URL!
    [movieDataBeingCreated writeToURL:[self createMoviesURL] atomically:YES];
}


@end
