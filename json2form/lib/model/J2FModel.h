//
//  J2FModel.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol J2FModelProtocol <NSObject>

@optional

@property (strong, nonatomic) NSArray *sections;
@property (strong, nonatomic) NSDictionary *results;
@property (strong, nonatomic) NSDictionary *elements;

@end

@interface J2FModel : NSObject<J2FModelProtocol>

@end
