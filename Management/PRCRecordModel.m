//
//  PRCRecordModel.m
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCRecordModel.h"
#import "PRCDeviceModel.h"

@implementation PRCRecordModel

- (id)initWithDeviceModel:(PRCDeviceModel *)deviceModel Name:(NSString *)name PhoneNumber:(NSString *)phongNumber {
    self = [super init];
    if (self) {
        self.deviceIndex = deviceModel.index;
        
        self.deviceName = deviceModel.deviceName;
        self.name = name;
        self.phoneNumber = phongNumber;
        _borrowDate = [NSDate date];
        _returnDate = nil;
        deviceModel.isBorrowed = YES;
    }
    return self;
}


- (BOOL)isReturn {
    return (self.returnDate != nil);
}
- (void)returnDevice {
    _returnDate = [NSDate date];
    [[PRCDataModel shardedDataModel] getDeviceAtIndex:self.deviceIndex].isBorrowed = NO;
}

- (NSString *)borrowDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return  [format stringFromDate:self.borrowDate];
}

- (NSString *)returnDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return  [format stringFromDate:self.returnDate];

}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeInteger:self.deviceIndex forKey:@"deviceIndex"];
    [aCoder encodeObject:self.borrowDate forKey:@"borrowDate"];
    [aCoder encodeObject:self.returnDate forKey:@"returnDate"];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.deviceIndex = [aDecoder decodeIntegerForKey:@"deviceIndex"];
        
        
        _borrowDate = [aDecoder decodeObjectForKey:@"borrowDate"];
        _returnDate = [aDecoder decodeObjectForKey:@"returnDate"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone{
    PRCRecordModel *copy = [[[self class] allocWithZone:zone] init];
    if (copy) {
        copy.name = [self.name copyWithZone:zone];
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.phoneNumber = [self.phoneNumber copyWithZone:zone];
        
        copy->_borrowDate = [self.borrowDate copyWithZone:zone];
        copy->_returnDate = [self.returnDate copyWithZone:zone];
    }
    return copy;
}







@end
