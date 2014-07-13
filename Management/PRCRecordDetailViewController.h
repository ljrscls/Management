//
//  PRCRecondDetailViewController.h
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRCRecordDetailViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLable;
@property (weak, nonatomic) IBOutlet UILabel *borrowDateLable;
@property (weak, nonatomic) IBOutlet UILabel *returnDateLable;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;

@property (nonatomic, weak) PRCRecordModel *recordModel;

@end
