//
//  J2FTableController.h
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@class J2FController;

@interface J2FTableController : UITableViewController

- (id)initWithParent:(J2FController *)parent;

@property (strong, nonatomic, readonly) J2FController *parent;

@end
