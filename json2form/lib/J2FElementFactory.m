//
//  J2FElementFactory.m
//  json2form
//
//  Created by sergio vieira on 07/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FElementFactory.h"
#import "ButtonElement.h"
#import "LabelElement.h"


@implementation J2FElementFactory

+ (id<J2FElementProtocol>)create:(kFieldType)type
{
    switch (type)
    {
        case kButtonType:
            return [[ButtonElement alloc] init];
        break;
        
        case kLabelType:
            return [[LabelElement alloc] init];
        break;

        default:
            return [[ButtonElement alloc] init];
    }
}

+ (id<J2FElementProtocol>)createWithString:(NSString *)type
{
    if ([type isEqualToString:kStrButtonType])
    {
        return [self create:kButtonType];
    }
    else if ([type isEqualToString:kStrLabelType])
    {
        return [self create:kLabelType];
    }
    
    return nil;
}

@end
