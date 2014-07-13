//
//  PRCDeviceDetailViewController.m
//  Management
//
//  Created by sse-23 on 14-7-11.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCDeviceDetailViewController.h"
#import "PRCDataModel.h"
#import "PRCDeviceModel.h"
#import "PRCRecordModel.h"
@interface PRCDeviceDetailViewController ()

@end

@implementation PRCDeviceDetailViewController

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
    [self configureView];
    [self configureNavigationBar];
    // Do any additional setup after loading the view.
}
#pragma mark - UI Methods
- (void)configureView{
    self.deviceNameLable.text = self.deviceModel.deviceName;
    self.deviceTypeLable.text = self.deviceModel.deviceType;
    if(self.deviceModel.isBorrowed)
        self.deviceStatusLable.text = @"YES";
    else
        self.deviceStatusLable.text = @"NO";
    
}

- (void)configureNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Borrow" style:UIBarButtonItemStyleDone target:self action:@selector(didClickBorrowButton)];
}

#pragma mark - Actions
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
}

- (BOOL)notAPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber.length != 11) {
        return YES;
    }
    return NO;
}

- (void)didClickBorrowButton {
    if (self.deviceModel.isBorrowed) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"设备已借出" delegate:self cancelButtonTitle:@"back" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self notAPhoneNumber:self.phoneTextField.text]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Phone number input Error!" delegate:self cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    PRCRecordModel *recordModel = [[PRCRecordModel alloc] initWithDeviceModel:self.deviceModel Name:self.nameTextField.text PhoneNumber:self.phoneTextField.text];
    
    [[PRCDataModel shardedDataModel] addRecord:recordModel];
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)didClickRemoveButton:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"这么做将移除此设备，确定吗？" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[PRCDataModel shardedDataModel] deleteDevice:self.deviceModel];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
