//
//  J2FController.h
//  json2form
//
//  Created by Paulo Pinheiro on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol J2FControllerProtocol <NSObject>

@optional
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)performConfigureCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@property (strong, nonatomic) UITableViewController *tableController;

@end

@interface J2FController : UIViewController<J2FControllerProtocol>

@end
