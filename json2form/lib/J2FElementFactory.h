//
//  J2FElementFactory.h
//  json2form
//
//  Created by sergio vieira on 07/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol J2FElementProtocol;

@interface J2FElementFactory : NSObject

+ (id<J2FElementProtocol>)create:(kFieldType)type;
+ (id<J2FElementProtocol>)createWithString:(NSString *)type;

@end
