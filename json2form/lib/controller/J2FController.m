//
//  J2FController.m
//  json2form
//
//  Created by Sérgio Vieira on 6/5/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "J2FController.h"
#import "J2FTableController.h"
#import "J2FModel.h"

@interface J2FController ()

@end

@implementation J2FController

@synthesize tableController = _tableController, model = _model;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Lazy Instantiating
- (J2FTableController *)tableController
{
    if (!_tableController)
    {
        _tableController = [[J2FTableController alloc] initWithParent:self];
    }
    
    return _tableController;
}

- (J2FModel *)model
{
    if (!_model)
    {
        _model = [[J2FModel alloc] init];
    }
    
    return _model;
}

#pragma mark - J2FControllerProtocol
- (NSInteger)numberOfSections
{
    return [self.model.sections count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = self.model.sections[section];
    
    return [self.model.results[sectionTitle] count];
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kDefaultCellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kDefaultCellIdentifier];
    }
    
    return cell;
}

- (void)performConfigureCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UITableView *)tableView
{
    return self.tableController.tableView;
}

#pragma mark - Private Methods
- (void)loading
{
    /** initializing **/
    [self.view addSubview:self.tableController.view];
}

@end
