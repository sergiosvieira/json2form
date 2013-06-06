//
//  J2FField.m
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FField.h"


@implementation J2FField

@synthesize caption = _caption, placeholder =_placeholder, defaulValue = _defaulValue, keyboardType = _keyboardType,
    values = _values, icon = _icon, currentValue = _currentValue;

- (NSString *)caption
{
    return NSLocalizedString(_caption, nil);
}

- (void)configureCell:(UITableViewCell *)cell
{
}

@end