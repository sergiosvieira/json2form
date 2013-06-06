//
//  J2FModel.m
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FModel.h"

@implementation J2FModel

@synthesize sections = _sections, results = _results;

#pragma mark - Lazy Instantiating
- (NSDictionary *)results
{
    if (!_results)
    {
        _results = [J2FCoreData loadFromJSON:@"sample"];
    }
    
    return _results;
}

- (NSArray *)sections
{
    if (!_sections)
    {
        _sections = [J2FCoreData sections:self.results];
    }
    
    return _sections;
}

@end
