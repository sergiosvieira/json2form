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
    [field addObserver:self forKeyPath:@"currentValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentValue"])
    {
        self.changed = @(YES);
    }
}

- (id)valueForKey:(NSString *)key
{
    if ([key isEqualToString:@"changed"])
    {
        return self.changed;
    }

    return nil;
}

@end
