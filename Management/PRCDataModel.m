//
//  PRCDataModel.m
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCDataModel.h"
#import "PRCRecordModel.h"
#import "PRCDeviceModel.h"
static PRCDataModel *dataModel = nil;

@implementation PRCDataModel

+ (PRCDataModel *)shardedDataModel {
    if (!dataModel) {
        dataModel = [[PRCDataModel alloc] init];
    }
    return dataModel;
}

- (id)init {
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

#pragma mark - Porperties
- (NSMutableArray *)deviceArray {
    if (!_deviceArray) {
        _deviceArray = [[NSMutableArray alloc] init];
    }
    return _deviceArray;
}

- (NSMutableArray *)recordArray {
    if (!_recordArray) {
        _recordArray = [[NSMutableArray alloc] init];
    }
    return _recordArray;
}


- (void)addDevice:(PRCDeviceModel *)deviceModel {
    [self.deviceArray addObject:deviceModel];
    
    [self sort];
    //sort
    
    [self saveData];//save
}
- (void)addRecord:(PRCRecordModel *)recordModel {
    [self.recordArray addObject:recordModel];
    
    [self sort];
    //sort
    
    [self saveData];
}


- (void)deleteDevice:(PRCDeviceModel *)deviceModel {
    [self.deviceArray removeObject:deviceModel];
    
    [self sort];
    //sort
    
    [self saveData];
}
- (void)deleteRecord:(PRCRecordModel *)recordModel {
    [self.recordArray removeObject:recordModel];
    
    [self sort];
    //sort
    
    [self saveData];
}


- (PRCDeviceModel *)getDeviceAtIndex:(NSUInteger)index {
    return [self.deviceArray objectAtIndex:index];
    
}
- (PRCRecordModel *)getRecordAtIndex:(NSUInteger)index {
    return [self.recordArray objectAtIndex:index];
    
}


- (void)deleteDeviceAtIndex:(NSUInteger)index{
    [self.deviceArray removeObjectAtIndex:index];
    
    [self sort];
    //sort
    
    [self saveData];
}
- (void)deleteRecordAtIndex:(NSUInteger)index{
    [self.recordArray removeObjectAtIndex:index];
    
    [self sort];
    //sort
    
    [self saveData];
}

- (void)saveData {
    [self saveDeviceData];
    [self saveRecordData];
}

- (void)loadData {
    [self loadDeviceData];
    [self loadRecordData];//*/
}

- (void)saveDeviceData {
    NSMutableData *deviceData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:deviceData];
    [archiver encodeObject:self.deviceArray];
    [archiver finishEncoding];
    
    [deviceData writeToFile:[self deviceListPath] atomically:YES];
    
}

- (void)saveRecordData {
    NSMutableData *recordData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:recordData];
    [archiver encodeObject:self.recordArray];
    [archiver finishEncoding];
    
    [recordData writeToFile:[self recordListPath] atomically:YES];
    
    
}

- (void)loadDeviceData {
    NSString *deviceListPath = [self deviceListPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:deviceListPath]) {
        NSMutableData *deviceData = [[NSMutableData alloc] initWithContentsOfFile:deviceListPath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:deviceData];
        
        self.deviceArray = [unarchiver decodeObject];
        [unarchiver finishDecoding];
    }
}

- (void)loadRecordData {
    NSString *recordLishPath = [self recordListPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:recordLishPath]) {
        NSMutableData *recordData = [[NSMutableData alloc] initWithContentsOfFile:recordLishPath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:recordData];
        
        self.recordArray = [unarchiver decodeObject];
        [unarchiver finishDecoding];
    }
    
}

- (void)returnDevice:(PRCRecordModel *)recordModel {
    [recordModel returnDevice];
    
    [self sort];
    //sort
    
    [self saveData];
}

#pragma mark - Utils
#pragma matk path
- (NSString *)applicationDocumentsDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)deviceListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"deviceList.plist"];
}

- (NSString *)recordListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"recordList.plist"];
}
#pragma mark sort

- (void)sort {
    
    [self.recordArray setArray:[self.recordArray sortedArrayUsingFunction:sortRecord context:nil]];
    
}

NSInteger sortRecord(id l, id r, void *context) {
    PRCRecordModel *lRecordModel = (PRCRecordModel *)l;
    PRCRecordModel *rRecordModel = (PRCRecordModel *)r;
    
    if ([lRecordModel isReturn]) { // lRecordModel已经归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        } else { // rRecordModel未归还
            return NSOrderedDescending; // 已归还的记录排在后面
        }
    } else { // lRecordModel未归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return NSOrderedAscending;
        } else { // rRecordModel未归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        }
    }
}

@end
