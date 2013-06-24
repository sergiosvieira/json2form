//
//  IconButton.m
//  Weelo
//
//  Created by Paulo Pinheiro on 6/21/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "IconButton.h"

#import "J2FCell.h"


@implementation IconButton

- (void)configureCell:(UITableViewCell *)cell
{
    [super configureCell:cell];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.selectionStyle = [ThemeManager themeCellSelectionStyleNamed:@"kCellSelectionStyle"];
    
    J2FCell *ccell = (J2FCell *)cell;
    UIImage *image = [UIImage imageNamed:self.icon];
    CGRect frame = ccell.caption.frame;

    [ccell.icon setImage:image];
    ccell.textField.hidden = YES;
    ccell.caption.text = self.caption;
    frame.origin.x += 50.f;
    ccell.caption.frame = frame;
    ccell.caption.textAlignment = NSTextAlignmentLeft;
    
    /** icon **/
    frame = ccell.icon.frame;
    frame.origin.x = 5.f;
    frame.origin.y = 0.f;
    ccell.icon.frame = frame;
}

@end
