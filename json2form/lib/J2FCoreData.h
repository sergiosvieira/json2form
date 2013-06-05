//
//  J2FCoreData.h
//  json2form
//
//  Created by Paulo Pinheiro on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface J2FCoreData : NSObject

+ (NSDictionary *)loadFromJSON:(NSString *)filename;

@end
