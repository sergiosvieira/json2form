//
//  LabelElement.m
//  json2form
//
//  Created by sergio vieira on 07/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "LabelElement.h"

@implementation LabelElement
{
    UILabel *label;
}

- (id)viewWithCaption:(NSString *)caption
{
    if (!label)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 250.f, [self height])];
        
        [label setFont:[UIFont systemFontOfSize:12.f]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:caption];
    }
    
    return label;
}

- (CGFloat)height
{
    return 20.f + kJ2FDefaultFooterPadding;
}

- (void)setValue:(id)aValue
{
    NSAssert([aValue isKindOfClass:[NSString class]], [Messages invalidObject]);
    
    [label setText:aValue];
}


@end
