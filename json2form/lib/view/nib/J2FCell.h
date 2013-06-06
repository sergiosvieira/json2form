//
//  J2FCell.h
//  json2form
//
//  Created by sergio vieira on 06/06/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface J2FCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *caption;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIImageView *icon;

@end
