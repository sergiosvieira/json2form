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
    ccell.textField.text =  self.currentValue ? self.currentValue : self.defaulValue;
    ccell.textField.inputView = self.datePicker;
    ccell.textField.delegate = self;
    
    /** customizing **/
    CGRect iconFrame = ccell.icon.frame;
    CGRect textFrame = ccell.textField.frame;

    iconFrame.origin = CGPointMake(5.f, 0.f);
    ccell.icon.frame = iconFrame;

    textFrame.origin.x = 50.f;
    ccell.textField.frame = textFrame;
    
    [super configureCell:cell];
}

#pragma mark - Selectors
- (void)datePickerValueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *date = [dateFormat stringFromDate:datePicker.date ];
    
    self.currentValue = date;
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:@"currentValue"])
    {
        return self.currentValue;
    }
    
    return nil;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    /** this must be null **/
}

@end
