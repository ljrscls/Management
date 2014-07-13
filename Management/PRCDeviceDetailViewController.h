//
//  PRCDeviceDetailViewController.h
//  Management
//
//  Created by sse-23 on 14-7-11.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRCDeviceDetailViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLable;// 名称
@property (weak, nonatomic) IBOutlet UILabel *deviceTypeLable;// 类型
@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLable;// 状态

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (nonatomic, weak) PRCDeviceModel *deviceModel;

@end
