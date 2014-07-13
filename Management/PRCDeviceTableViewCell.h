//
//  PRCDeviceTableViewCell.h
//  Management
//
//  Created by sse-23 on 14-7-11.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRCDeviceModel;

@interface PRCDeviceTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLable;
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLable;
@property (nonatomic, strong) PRCDeviceModel *deviceModel;

@end
