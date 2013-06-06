//
//  J2FView.m
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FView.h"
#import "J2FField.h"
#import "J2FCell.h"


@implementation J2FView

- (void)configureCell:(UITableViewCell *)cell withJ2FField:(J2FField *)field
{
    [field configureCell:cell];
}

@end
