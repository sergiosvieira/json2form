//
//  DateType.m
//  json2form
//
//  Created by Sérgio Vieira on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "DateField.h"
#import "J2FCell.h"


@implementation DateField

#pragma mark - Lazy Instantiating
- (UIDatePicker *)datePicker
{
    if (!_datePicker)
    {
        _datePicker = [[UIDatePicker alloc] init];
    }
   
    return _datePicker;
}

#pragma mark - J2FFieldProtocol
- (void)configureCell:(UITableViewCell *)cell
{
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

    J2FCell *ccell = (J2FCell *)cell;
    
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text = self.defaulValue;
    ccell.textField.inputView = self.datePicker;
}

#pragma mark - Selectors
- (void)datePickerValueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *date = [dateFormat stringFromDate:datePicker.date ];
    
    self.currentValue = date;
}

@end
