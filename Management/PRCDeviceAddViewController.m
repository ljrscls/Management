//
//  PRCDeviceAddViewController.m
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCDeviceAddViewController.h"
#import "PRCDeviceModel.h"

@interface PRCDeviceAddViewController ()

@end

@implementation PRCDeviceAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureNavigationBar];
    
    // Do any additional setup after loading the view.
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    self.navigationItem.title = @"Add Device";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(didClickAddButton)];
}

#pragma mark - Actions
- (void)didClickAddButton {
    
    PRCDeviceModel *deviceModel = [[PRCDeviceModel alloc] initWithDeviceName:self.deviceNameTextField.text DeviceType:self.deviceTypeTextField.text];

    [[PRCDataModel shardedDataModel] addDevice:deviceModel];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.deviceNameTextField resignFirstResponder];
    [self.deviceTypeTextField resignFirstResponder];
}
//*/
@end
