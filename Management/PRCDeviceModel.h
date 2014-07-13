//
//  PRCDeviceModel.h
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRCDeviceModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *deviceType;
@property (nonatomic) NSUInteger index;
@property (nonatomic) BOOL isBorrowed;
- (id)initWithDeviceName:(NSString *)deviceName DeviceType:(NSString *)deviceType;

@end
