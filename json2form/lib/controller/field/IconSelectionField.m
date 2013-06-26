//
//  IconSelectionField.m
//  Weelo
//
//  Created by Sérgio Vieira on 6/11/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "IconSelectionField.h"

#import "J2FCell.h"


@implementation IconSelectionField

- (void)configureCell:(UITableViewCell *)cell
{
    [super configureCell:cell];
    
    J2FCell *ccell = (J2FCell *)cell;
    UIImage *image = [UIImage imageNamed:self.icon];

    [ccell.icon setImage:image];
    [super configureCell:cell];
}


@end
