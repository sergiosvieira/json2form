//
//  SelectionType.m
//  json2form
//
//  Created by Sérgio Vieira on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "SelectionField.h"
#import "J2FCell.h"

@implementation SelectionField

#pragma mark - Lazy Instantiating
- (UIPickerView *)picker
{
    if (!_picker)
    {
        _picker = [[UIPickerView alloc] init];
    }
   
    return _picker;
}

#pragma mark - Public Methods
- (void)configureCell:(UITableViewCell *)cell
{
    J2FCell *ccell = (J2FCell *)cell;
 
    ccell.textField.delegate = self;
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text =  self.currentValue ? self.currentValue : self.defaulValue;
    ccell.textField.inputView = self.picker;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[self.values count] + 1];
    
    [array addObject:@""];
    [array addObjectsFromArray:self.values];
    results = array;
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    /** customizing **/
    CGRect iconFrame = ccell.icon.frame;
    CGRect textFrame = ccell.textField.frame;

    iconFrame.origin = CGPointMake(5.f, 0.f);
    ccell.icon.frame = iconFrame;

    textFrame.origin.x = 50.f;
    ccell.textField.frame = textFrame;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentValue = results[row];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return [results count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return results[row];
}

@end
