//
//  PRCDeviceTableViewCell.m
//  Management
//
//  Created by sse-23 on 14-7-11.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCDeviceTableViewCell.h"

@implementation PRCDeviceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithIndex:(NSInteger)index DeviceName:(NSString *)name DeviceType:(NSString *)type deviceStatus:(BOOL)status{
    self = [super init];
    if(self){
    
    }
    return self;
}

@end
