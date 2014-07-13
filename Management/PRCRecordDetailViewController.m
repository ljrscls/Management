//
//  PRCRecondDetailViewController.m
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCRecordDetailViewController.h"
#import "PRCRecordModel.h"
#import "PRCDataModel.h"
#import "PRCTestViewController.h"

@interface PRCRecordDetailViewController ()

@end

@implementation PRCRecordDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self dataLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnButton:(id)sender {
    if (self.recordModel.isReturn) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"将要移除此记录，确定吗？" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alertView show];
    } else {
        [[PRCDataModel shardedDataModel] returnDevice:self.recordModel];
        [self dataLoad];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[PRCDataModel shardedDataModel] deleteRecord:self.recordModel];
        [self dataLoad];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
- (void)dataLoad {
    self.deviceNameLable.text = self.recordModel.deviceName;
    self.nameLable.text = self.recordModel.name;
    self.phoneNumberLable.text = self.recordModel.phoneNumber;
    self.borrowDateLable.text = self.recordModel.borrowDateString;
    if (self.recordModel.isReturn) {
        [self.returnButton setTitle:@"Remove" forState:0];
        self.returnDateLable.text = self.recordModel.returnDateString;
    } else {
        [self.returnButton setTitle:@"Return" forState:0];
        self.returnDateLable.text = @"Never";
    }
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 

@end
