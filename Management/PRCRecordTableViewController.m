//
//  PRCRecondTableViewController.m
//  Management
//
//  Created by sse-23 on 14-7-11.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCRecordTableViewController.h"
#import "PRCRecordModel.h"
#import "PRCRecordTableViewCell.h"
#import "PRCRecordDetailViewController.h"

@interface PRCRecordTableViewController ()

@end

@implementation PRCRecordTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[PRCDataModel shardedDataModel] recordArray] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PRCRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecondCell" forIndexPath:indexPath];
    
    cell.recordModel = [[PRCDataModel shardedDataModel] getRecordAtIndex:indexPath.row];
    cell.deviceNameLable.text = cell.recordModel.deviceName;
    cell.deviceBorrowTimeLable.text = cell.recordModel.borrowDateString;
    if (cell.recordModel.isReturn) {
        cell.deviceStatusLable.text = @"Returned";
    } else {
        cell.deviceStatusLable.text = nil;
    }
    // Configure the cell...*/
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    PRCRecordDetailViewController *recordDetailViewController = segue.destinationViewController;
    
    recordDetailViewController.recordModel = ((PRCRecordTableViewCell *)sender).recordModel;
}


@end
