//
//  J2FField.m
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FField.h"


@implementation J2FField

@synthesize caption = _caption;

- (NSString *)caption
{
    return NSLocalizedString(_caption, nil);
}

- (NSString *)placeholder
{
    return @"";
}

- (NSString *)defaulValue
{
    return @"";
}

- (UIKeyboardType)keyboardType
{
    return UIKeyboardTypeDefault;
}

- (NSArray *)values
{
    return nil;
}

- (UIImage *)icon
{
    return nil;
}

@end
