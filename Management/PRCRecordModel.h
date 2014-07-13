//
//  PRCRecordModel.h
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRCRecordModel : NSObject <NSCoding, NSCopying>


@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic) NSUInteger deviceIndex;
@property (nonatomic, readonly) NSDate *borrowDate;
@property (nonatomic, readonly) NSDate *returnDate;

- (id)initWithDeviceModel:(PRCDeviceModel *)deviceModel Name:(NSString *)name PhoneNumber:(NSString *)phongNumber;

- (BOOL)isReturn;
- (void)returnDevice;

- (NSString *)borrowDateString;
- (NSString *)returnDateString;

@end
