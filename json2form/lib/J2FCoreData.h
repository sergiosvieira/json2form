//
//  J2FCoreData.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface J2FCoreData : NSObject

+ (NSDictionary *)loadFromJSON:(NSString *)filename;
/**
    @description: return a array with sections titles
    @in: a valid F2FJSON dictionary
**/
+ (NSArray *)sections:(NSDictionary *)dict;

@end
