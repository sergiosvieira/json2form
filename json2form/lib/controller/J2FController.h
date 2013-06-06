//
//  J2FController.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@class J2FTableController, J2FModel;
@protocol J2FControllerProtocol <NSObject>

@optional
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)performConfigureCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableView *)tableView;

@property (strong, nonatomic) J2FTableController *tableController;
@property (strong, nonatomic) J2FModel *model;

@end

@interface J2FController : UIViewController<J2FControllerProtocol>

@end
