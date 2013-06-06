//
//  SelectionType.m
//  json2form
//
//  Created by Paulo Pinheiro on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "SelectionField.h"
#import "J2FCell.h"

@implementation SelectionField

- (void)configureCell:(UITableViewCell *)cell
{
    J2FCell *ccell = (J2FCell *)cell;
    
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text = self.defaulValue;
}

@end
