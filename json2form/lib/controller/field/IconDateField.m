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
    [super configureCell:cell];

    UIImage *image = [UIImage imageNamed:self.icon];
    J2FCell *ccell = (J2FCell *)cell;

    [ccell.icon setImage:image];
    [super configureCell:cell];
}

#pragma mark - Selectors

@end
