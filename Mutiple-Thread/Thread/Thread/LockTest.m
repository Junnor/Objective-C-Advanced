//
//  LockTest.m
//  Thread
//
//  Created by Ju on 2021/1/29.
//

#import "LockTest.h"

@interface LockTest()

@property (nonatomic, strong) NSLock *ticketLock;
@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation LockTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化
        _ticketLock = [[NSLock alloc] init];
        _moneyLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)sellTicket {
    [self.ticketLock lock];
    [super sellTicket];
    [self.ticketLock unlock];
}

- (void)drawMoney {
    [self.moneyLock lock];
    [super drawMoney];
    [self.moneyLock unlock];
}

- (void)saveMoney {
    [self.moneyLock lock];
    [super saveMoney];
    [self.moneyLock unlock];
}

@end
