//
//  J2FView.h
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol J2FViewProtocol<NSObject>

@optional
- (void)configureCell:(UITableViewCell *)cell withJ2FField:(J2FField *)field;

@end

@interface J2FView : NSObject<J2FViewProtocol>

@end
