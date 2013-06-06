//
//  J2FFieldFactory.m
//  json2form
//
//  Created by Paulo Pinheiro on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FFieldFactory.h"
#import "J2FField.h"
#import "TextField.h"


@implementation J2FFieldFactory

+ (id<J2FFieldProtocol>)create:(kFieldType)type
{
    switch (type)
    {
        case kTextType:
            return [[TextField alloc] init];
        break;
        
        default:
            return [[TextField alloc] init];
    }
}

+ (id<J2FFieldProtocol>)createWithString:(NSString *)type
{
    if ([type isEqualToString:kStrTextField])
    {
        return [self create:kTextType];
    }
    
    return nil;
}

@end