//
//  J2FConstants.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, kFieldType)
{
    kTextType = 0,
    kDateType,
    kSelectionType,
    kTextIconType,
    kIconType,
    kButtonType,
    kLabelType
};

// app related constants
FOUNDATION_EXPORT NSString *const kDefaultCellIdentifier;

static const CGFloat kDefaultSectionHeight = 44.f;