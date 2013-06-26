//
//  J2FField.m
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FField.h"

#import "J2FCell.h"

@implementation J2FField

@synthesize identifier = _identifier, caption = _caption, placeholder =_placeholder, defaulValue = _defaulValue, keyboardType = _keyboardType,
    values = _values, icon = _icon, currentValue = _currentValue, textType = _textType;

- (NSString *)caption
{
    return NSLocalizedString(_caption, nil);
}

- (void)configureCell:(UITableViewCell *)cell
{
    /** customizing **/
    J2FCell *ccell = (J2FCell *)cell;
    
    CGRect frame = ccell.icon.frame;
    
    frame.origin = CGPointMake(15.f, 12.f);
    ccell.icon.frame = frame;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.currentValue = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    [theTextField resignFirstResponder];
    
    return YES;
}

@end