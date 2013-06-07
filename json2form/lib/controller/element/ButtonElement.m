//
//  ButtonElement.m
//  json2form
//
//  Created by sergio vieira on 07/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "ButtonElement.h"

@implementation ButtonElement

- (id)viewWithCaption:(NSString *)caption
{
    return [self createButtonWithTitle:caption];
}

- (CGFloat)height
{
    return 250.f + kJ2FDefaultFooterPadding;
}

#pragma mark - Private Methods
- (UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *result = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (result)
    {
        CGRect frame = CGRectMake(
            80.0,
            210.0,
            160.0,
            40.0
        );
    
        result.frame = frame;
        [result setTitle:title forState:UIControlStateNormal];
    }
    
    return result;
}

@end
