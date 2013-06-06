//
//  J2FFieldFactory.h
//  json2form
//
//  Created by Paulo Pinheiro on 6/6/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>


@class J2FField;

@protocol J2FFieldProtocol;

@interface J2FFieldFactory : NSObject

+ (id<J2FFieldProtocol>)create:(kFieldType)type;
+ (id<J2FFieldProtocol>)createWithString:(NSString *)type;

@end
