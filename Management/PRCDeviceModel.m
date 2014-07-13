//
//  PRCDeviceModel.m
//  Management
//
//  Created by sse-23 on 14-7-12.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCDeviceModel.h"

@implementation PRCDeviceModel

- (id)initWithDeviceName:(NSString *)deviceName DeviceType:(NSString *)deviceType {
    self = [super init];
    if (self) {
        self.deviceName = deviceName;
        self.deviceType = deviceType;
        self.isBorrowed = NO;
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.deviceType forKey:@"deviceType"];
    [aCoder encodeInteger:self.index forKey:@"index"];
    [aCoder encodeBool:self.isBorrowed forKey:@"isBorrowed"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceType = [aDecoder decodeObjectForKey:@"deviceType"];
        self.index = [aDecoder decodeIntegerForKey:@"index"];
        self.isBorrowed = [aDecoder decodeBoolForKey:@"isBorrowed"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    PRCDeviceModel *copy = [[[self class] allocWithZone:zone] init];
    if (copy) {
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.deviceType = [self.deviceType copyWithZone:zone];
        copy.isBorrowed = self.isBorrowed;
    }
    return copy;
}


@end
