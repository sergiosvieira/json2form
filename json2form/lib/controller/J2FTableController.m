//
//  J2FTableController.m
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FTableController.h"
#import "J2FController.h"
#import "J2FElement.h"
#import "J2FElementFactory.h"


@interface J2FTableController ()

@property (strong, nonatomic, readwrite) J2FController *parent;

@end

@implementation J2FTableController

- (id)initWithParent:(J2FController *)parent
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self)
    {
        self.parent = parent;
    }
    
    return self;
}

- (id)init
{
    NSAssert(nil, @"You must use initWithParent constructor instead.");
    
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /** customizing **/
    
    self.tableView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.tableView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.tableView.layer.shadowOpacity = 0.4;
    self.tableView.layer.shadowRadius = 5.0f;
    self.tableView.clipsToBounds = NO;
    self.tableView.layer.masksToBounds = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.parent numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.parent numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.parent cellForRowAtIndexPath:indexPath];
    
    [self.parent performConfigureCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.parent titleForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kJ2FDefaultSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self.parent viewForFooterInSection:section];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.parent didSelectRowAtIndexPath:indexPath];
}

@end
