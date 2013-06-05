//
//  J2FTableController.h
//  json2form
//
//  Created by Paulo Pinheiro on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@class J2FController;

@interface J2FTableController : UITableViewController

@property (strong, nonatomic, readonly) J2FController *parent;

@end
