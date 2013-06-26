//
//  TextField.m
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "TextField.h"
#import "J2FCell.h"


@implementation TextField

- (void)configureCell:(UITableViewCell *)cell
{
    J2FCell *ccell = (J2FCell *)cell;
    
    ccell.textField.delegate = self;
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text =  self.currentValue ? self.currentValue : self.defaulValue;
    [super configureCell:cell];
}

@end
