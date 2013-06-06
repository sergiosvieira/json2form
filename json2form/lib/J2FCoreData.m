//
//  J2FCoreData.m
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FCoreData.h"

#import "JSONKit.h"

@implementation J2FCoreData

+ (NSDictionary *)loadFromJSON:(NSString *)filename
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"assets" ofType:@"bundle"];
    NSString *imageName = [[NSBundle bundleWithPath:bundlePath] pathForResource:filename ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:imageName];
    
    NSAssert(jsonData, [J2FMessages nilObject]);
    
    JSONDecoder *decoder = [[JSONDecoder alloc] initWithParseOptions:JKParseOptionNone];
    NSError *error = nil;
    
    NSDictionary *result = [decoder objectWithData:jsonData error:&error];
    
    if (error)
    {
        NSLog(@"Error: %@", error);
    }
    
    NSAssert([self isValidJ2FJSON:result], @"invalid J2FJSON format.");
    
    return result;
}

/**
    @description: return a array with sections titles
    @in: a valid F2FJSON dictionary
**/
+ (NSArray *)sections:(NSDictionary *)dict
{
    NSAssert(dict, [J2FMessages nilObject]);
    
    return dict.allKeys;
}

#pragma mark - Private Methods
+ (BOOL)isValidJ2FJSON:(NSDictionary *)dict
{
    /** TODO: you must implement this **/
    return YES;
}

@end
