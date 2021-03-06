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
#import "J2FView.h"
#import "J2FField.h"
#import "J2FElement.h"
#import "J2FElementFactory.h"


@interface J2FController ()

@end

@implementation J2FController

@synthesize tableController = _tableController, model = _model, viewCell = _viewCell;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loading];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view endEditing:YES];
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

- (J2FView *)viewCell
{
    if (!_viewCell)
    {
        _viewCell = [[J2FView alloc] init];
    }
    
    return _viewCell;
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
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"J2FCell" owner:self options:nil];
        
        cell = array[0];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    
    return cell;
}

- (void)performConfigureCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    J2FField *field = temporaryFieldsList[indexPath];
    
    if (!field)
    {
        field = [J2FCoreData field:self.model.results withIndexPath:indexPath];
        temporaryFieldsList[indexPath] = field;
    }
    
    [self.viewCell configureCell:cell withJ2FField:field];
    [self.viewCell addObserver:self forKeyPath:@"changed" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
        context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@"changed"])
    {
       [self.tableView reloadData];
    }
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UITableView *)tableView
{
    return self.tableController.tableView;
}

- (NSString *)titleForHeaderInSection:(NSInteger)section
{
    NSString *title = self.isHideSectionTitle ? @"" : self.model.sections[section];

    return title;
}

- (UIView *)viewForFooterInSection:(NSInteger)section
{
    UIView *sectionView = temporaryElementViewList[@(section)];
    
    if (!sectionView)
    {
        NSInteger footerHeight = 0;
        NSDictionary *rows = [J2FCoreData allFieldsConfiguration:self.model.elements inSection:section];
        NSArray *allValues = rows.allValues;
        NSArray *allKeys = rows.allKeys;
        
        for (int index = 0; index < [allKeys count]; index++)
        {
            NSDictionary *dict = allValues[index];
            NSString *caption = dict[kCaptionField];
            NSString *type = dict[kTypeField];
            J2FElement *element = [J2FElementFactory createWithString:type];

            sectionView = [[UIView alloc] init];

            id genericElement = [element viewWithCaption:caption];
            
            [sectionView addSubview:genericElement];
            footerHeight += [element height];
            temporaryElementViewList[@(section)] = sectionView;
            
            NSString *title = allKeys[index];
            
            temporaryElementList[title] = element;
        }
        
        CGRect frame = sectionView.frame;
        
        frame.size.height = footerHeight + kJ2FDefaultFooterPadding;
        sectionView.frame = frame;
    }
    
    return sectionView;
}

#pragma mark - Public Methods
- (void)setValue:(NSString *)value toIndexPath:(NSIndexPath *)indexPath
{
    J2FField *field = temporaryFieldsList[indexPath];
    
    field.currentValue = value;
}

- (void)setElementValue:(NSString *)aValue toElementCaption:(NSString *)anCaption
{
    J2FElement *element = temporaryElementList[anCaption];
    
    [element setValue:aValue];
}

- (NSDictionary *)allValues
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:[self.model.results.allKeys count]];
    
    for (J2FField *field in temporaryFieldsList.allValues)
    {
        if (field.identifier && field.currentValue)
        {
            result[field.identifier] = field.currentValue;
        }
    }
    
    return result;
}

- (void)setValuesWithDict:(NSDictionary *)dict
{
    NSAssert(dict, [Messages nilObject]);
    
    for (NSString *identifier in dict.allKeys)
    {
        for (J2FField *field in temporaryFieldsList.allValues)
        {
            if ([identifier isEqualToString:field.identifier])
            {
                field.currentValue = dict[identifier];
            }
        }
    }
}

#pragma mark - Private Methods
- (void)loading
{
    /** initializing **/
    [self.view addSubview:self.tableController.view];
    temporaryFieldsList = [[NSMutableDictionary alloc] init];
    temporaryElementViewList = [[NSMutableDictionary alloc] init];
    temporaryElementList = [[NSMutableDictionary alloc] init];
}

@end
