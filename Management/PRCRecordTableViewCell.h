//
//  PRCRecordTableViewCell.h
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRCRecordModel;

@interface PRCRecordTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *deviceNameLable;
@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLable;
@property (weak, nonatomic) IBOutlet UILabel *deviceBorrowTimeLable;
@property (nonatomic, strong) PRCRecordModel *recordModel;
@end
