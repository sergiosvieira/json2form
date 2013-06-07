//
//  J2FField.h
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol J2FFieldProtocol<NSObject>

@required
- (void)configureCell:(UITableViewCell *)cell;

@optional
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *caption;
@property (strong, nonatomic) NSString *placeholder;
@property (strong, nonatomic) NSString *defaulValue;
@property (assign, nonatomic) UIKeyboardType keyboardType;
@property (strong, nonatomic) NSArray *values;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *currentValue;

@end

@interface J2FField : NSObject<J2FFieldProtocol, UITextFieldDelegate>

@end
