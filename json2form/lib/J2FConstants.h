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

// fields captions
FOUNDATION_EXPORT NSString *const kTypeField;
FOUNDATION_EXPORT NSString *const kCaptionField;
FOUNDATION_EXPORT NSString *const kPlaceHolderField;
FOUNDATION_EXPORT NSString *const kDefaultValueField;
FOUNDATION_EXPORT NSString *const kKeyBoardStyleField;
FOUNDATION_EXPORT NSString *const kValuesField;
FOUNDATION_EXPORT NSString *const kIconField;

// string fields type
FOUNDATION_EXPORT NSString *const kStrTextField;
FOUNDATION_EXPORT NSString *const kStrCaptionField;
FOUNDATION_EXPORT NSString *const kStrPlaceHolderField;
FOUNDATION_EXPORT NSString *const kStrDefaultValueField;
FOUNDATION_EXPORT NSString *const kStrKeyBoardStyleField;
FOUNDATION_EXPORT NSString *const kStrValuesField;
FOUNDATION_EXPORT NSString *const kStrIconField;

static const CGFloat kDefaultSectionHeight = 44.f;