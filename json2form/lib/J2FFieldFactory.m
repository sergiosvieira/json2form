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
#import "DateField.h"
#import "SelectionField.h"
#import "IconField.h"
#import "IconDateField.h"

@implementation J2FFieldFactory

+ (id<J2FFieldProtocol>)create:(kFieldType)type
{
    switch (type)
    {
        case kTextType:
            return [[TextField alloc] init];
        break;
        
        case kDateType:
            return [[DateField alloc] init];
        break;
        
        case kSelectionType:
            return [[SelectionField alloc] init];
        break;
        
        case kIconType:
            return [[IconField alloc] init];
        break;
        
        case kDateIconType:
            return [[IconDateField alloc] init];
        break;
        
        default:
            return nil;
    }
}

+ (id<J2FFieldProtocol>)createWithString:(NSString *)type
{
    if ([type isEqualToString:kStrTextType])
    {
        return [self create:kTextType];
    }
    else if ([type isEqualToString:kStrDateType])
    {
        return [self create:kDateType];
    }
    else if ([type isEqualToString:kStrSelectionType])
    {
        return [self create:kSelectionType];
    }
    else if ([type isEqualToString:kStrIconType])
    {
        return [self create:kIconType];
    }
    else if ([type isEqualToString:kStrDateIconType])
    {
        return [self create:kDateIconType];
    }
    
    return nil;
}

@end