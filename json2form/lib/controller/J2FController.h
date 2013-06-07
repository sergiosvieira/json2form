//
//  J2FController.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@class J2FTableController, J2FModel, J2FView;
@protocol J2FControllerProtocol <NSObject>

@optional
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)performConfigureCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableView *)tableView;
- (NSString *)titleForHeaderInSection:(NSInteger)section;
- (UIView *)viewForFooterInSection:(NSInteger)section;

@property (strong, nonatomic) J2FTableController *tableController;
@property (strong, nonatomic) J2FModel *model;
@property (strong, nonatomic) J2FView *viewCell;
@end

@interface J2FController : UIViewController<J2FControllerProtocol>
{
    NSMutableDictionary *temporaryFieldsList;
    NSMutableDictionary *temporaryElementViewList;
}

- (void)setValue:(NSString *)value toIndexPath:(NSIndexPath *)indexPath;
- (NSDictionary *)allValues;
- (void)setValuesWithDict:(NSDictionary *)dict;

@end
