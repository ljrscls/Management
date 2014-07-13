//
//  PRCDataModel.h
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRCRecordModel, PRCDeviceModel;

@interface PRCDataModel : NSObject

+ (PRCDataModel *)shardedDataModel;

@property (nonatomic, strong) NSMutableArray *deviceArray;
@property (nonatomic, strong) NSMutableArray *recordArray;

- (void)addDevice:(PRCDeviceModel *)deviceModel;
- (void)addRecord:(PRCRecordModel *)recordModel;

- (void)deleteDevice:(PRCDeviceModel *)deviceModel;
- (void)deleteRecord:(PRCRecordModel *)recordModel;

- (PRCDeviceModel *)getDeviceAtIndex:(NSUInteger)index;
- (PRCRecordModel *)getRecordAtIndex:(NSUInteger)index;

- (void)deleteDeviceAtIndex:(NSUInteger)index;
- (void)deleteRecordAtIndex:(NSUInteger)index;

- (void)saveData;
- (void)loadData;

- (void)returnDevice:(PRCRecordModel *)recordModel;
@end
