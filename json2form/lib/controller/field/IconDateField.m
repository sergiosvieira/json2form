//
//  IconDateField.m
//  Weelo
//
//  Created by Paulo Pinheiro on 6/7/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "IconDateField.h"
#import "J2FCell.h"


@implementation IconDateField

#pragma mark - J2FFieldProtocol
- (void)configureCell:(UITableViewCell *)cell
{
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    UIImage *image = [UIImage imageNamed:self.icon];

    J2FCell *ccell = (J2FCell *)cell;
    
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text =  self.currentValue ? self.currentValue : self.defaulValue;
    ccell.textField.inputView = self.datePicker;
    ccell.textField.delegate = self;
    [ccell.icon setImage:image];
}

#pragma mark - Selectors

@end
