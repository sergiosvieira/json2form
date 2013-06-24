//
//  J2FCoreData.m
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FCoreData.h"
#import "J2FField.h"
#import "J2FFieldFactory.h"

#import "JSONKit.h"


@implementation J2FCoreData

+ (NSDictionary *)loadFromJSON:(NSString *)filename
{
    return [self loadFromJSON:filename inBundle:@"assets"];
}

+ (NSDictionary *)loadFromJSON:(NSString *)filename inBundle:(NSString *)bundle
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundle ofType:@"bundle"];
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

/**
    @description: return a array with rows of a section
    @in: a valid F2FJSON dictionary
**/
+ (NSArray *)rows:(NSDictionary *)dict withSection:(NSInteger)section
{
    NSAssert(dict, [J2FMessages nilObject]);
    NSAssert(section >= 0, [J2FMessages invalidSection]);
    
    NSDictionary *rows = [self allRows:dict fromSection:section];
    
    NSArray *sortedArray;
     
    sortedArray = [rows.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *a, NSString *b) {
        NSDictionary *dfirst = rows[a];
        NSDictionary *dsecond = rows[b];
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];

        [f setNumberStyle:NSNumberFormatterDecimalStyle];

        NSNumber *first = [f numberFromString:dfirst[@"order"]];
        NSNumber *second = [f numberFromString:dsecond[@"order"]];

        return [first compare:second];
    }];    
    
    return sortedArray;
}

+ (NSDictionary *)fieldsConfiguration:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath
{
    NSAssert( [self isValidJ2FJSON:dict], @"invalid J2FJSON format.");
    
    NSArray *fields = [self rows:dict withSection:indexPath.section];
    NSString *fieldTitle = fields[indexPath.row];
    NSDictionary *rows = [self allRows:dict fromSection:indexPath.section];
    
    return rows[fieldTitle];
}

+ (NSString *)fieldIdentifier:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath
{
    NSAssert( [self isValidJ2FJSON:dict], @"invalid J2FJSON format.");
    
    NSArray *fields = [self rows:dict withSection:indexPath.section];
    NSString *fieldTitle = fields[indexPath.row];
    
    return fieldTitle;
}

+ (NSDictionary *)allFieldsConfiguration:(NSDictionary *)dict inSection:(NSInteger)section
{
    NSAssert( [self isValidJ2FJSON:dict], @"invalid J2FJSON format.");
    
    NSDictionary *rows = [self allRows:dict fromSection:section];
    
    return rows;
}

+ (J2FField *)field:(NSDictionary *)dict withIndexPath:(NSIndexPath *)indexPath;
{
    NSAssert([self isValidJ2FJSON:dict], @"invalid J2FJSON format.");
    
    NSDictionary *fieldConfiguration = [self fieldsConfiguration:dict withIndexPath:indexPath];
    NSString *identifier = [self fieldIdentifier:dict withIndexPath:indexPath];
    NSString *type = fieldConfiguration[kTypeField];
    NSString *caption = fieldConfiguration[kCaptionField];
    NSString *placeholder = fieldConfiguration[kPlaceHolderField];
    NSString *icon = fieldConfiguration[kIconField];
    NSArray *values = fieldConfiguration[kValuesField];

    J2FField *field = (J2FField *)[J2FFieldFactory createWithString:type];

    field.identifier = identifier;
    field.caption = caption;
    field.placeholder = placeholder;
    field.icon = icon;
    field.values = values;
    
    return field;
}

#pragma mark - Private Methods
+ (BOOL)isValidJ2FJSON:(NSDictionary *)dict
{
    NSAssert(dict, [J2FMessages nilObject]);
    
    /** TODO: you must implement this **/
    return YES;
}

+ (NSDictionary *)allRows:(NSDictionary *)dict fromSection:(NSInteger)section
{
    NSArray *sections = [self sections:dict];
    
    if ([sections count] == 0)
    {
        return nil;
    }
    
    NSString *sectionTitle = sections[section];
    NSDictionary *rows = dict[sectionTitle];

    return rows;
}

@end
