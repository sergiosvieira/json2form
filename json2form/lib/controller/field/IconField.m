//
//  IconField.m
//  json2form
//
//  Created by Paulo Pinheiro on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "IconField.h"
#import "J2FCell.h"


@implementation IconField

- (void)configureCell:(UITableViewCell *)cell
{
    NSLog(@"--> %@", self.identifier);

    J2FCell *ccell = (J2FCell *)cell;
    UIImage *image = [UIImage imageNamed:self.icon];
    
    ccell.textField.delegate = self;
    ccell.caption.text = self.caption;
    ccell.textField.placeholder = self.placeholder;
    ccell.textField.text =  self.currentValue ? self.currentValue : self.defaulValue;
    [ccell.icon setImage:image];
    
    /** customizing **/
    CGRect iconFrame = ccell.icon.frame;
    CGRect textFrame = ccell.textField.frame;

    iconFrame.origin = CGPointMake(5.f, 0.f);
    ccell.icon.frame = iconFrame;

    textFrame.origin.x = 50.f;
    ccell.textField.frame = textFrame;

    if (self.isPassword)
    {
        ccell.textField.secureTextEntry = YES;
    }
}

@end
