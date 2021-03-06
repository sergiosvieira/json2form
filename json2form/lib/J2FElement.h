//
//  J2FElement.h
//  json2form
//
//  Created by sergio vieira on 07/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol J2FElementProtocol<NSObject>

@optional
- (id)viewWithCaption:(NSString *)caption;
- (CGFloat)height;
- (void)setValue:(id)aValue;

@end

@interface J2FElement : NSObject<J2FElementProtocol>

@end
