//
//  J2FCoreData.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>


@class J2FField;

@interface J2FCoreData : NSObject

+ (NSDictionary *)loadFromJSON:(NSString *)filename;
+ (NSDictionary *)loadFromJSON:(NSString *)filename inBundle:(NSString *)bundle;
/**
    @description: return a array with sections titles
    @in: a valid F2FJSON dictionary
**/
+ (NSArray *)sections:(NSDictionary *)dict;
/**
    @description: return a array with rows of a section
    @in: a valid F2FJSON dictionary
**/
+ (NSArray *)rows:(NSDictionary *)dict withSection:(NSInteger)section;
+ (NSDictionary *)fieldsConfiguration:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath;
+ (NSString *)fieldIdentifier:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath;
+ (NSDictionary *)allFieldsConfiguration:(NSDictionary *)dict inSection:(NSInteger)section;
+ (J2FField *)field:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath;

@end
