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
    kLabelType,
    kDateIconType,
    kSelectionIconType,
    kIconButtonType
};


// app related constants
FOUNDATION_EXPORT NSString *const kDefaultCellIdentifier;

// fields captions
FOUNDATION_EXPORT NSString *const kTypeField;
FOUNDATION_EXPORT NSString *const kCaptionField;
FOUNDATION_EXPORT NSString *const kPlaceHolderField;
FOUNDATION_EXPORT NSString *const kDefaultValueField;
FOUNDATION_EXPORT NSString *const kKeyBoardStyleField;
FOUNDATION_EXPORT NSString *const kValuesField;
FOUNDATION_EXPORT NSString *const kIconField;
FOUNDATION_EXPORT NSString *const kStrSelectionIconType;

// string fields type
FOUNDATION_EXPORT NSString *const kStrTextType;
FOUNDATION_EXPORT NSString *const kStrDateType;
FOUNDATION_EXPORT NSString *const kStrDateIconType;
FOUNDATION_EXPORT NSString *const kStrSelectionType;
FOUNDATION_EXPORT NSString *const kStrIconType;
FOUNDATION_EXPORT NSString *const kStrIconButtonType;

static const CGFloat kJ2FDefaultSectionHeight = 44.f;
static const CGFloat kJ2FDefaultFooterPadding = 10.f;