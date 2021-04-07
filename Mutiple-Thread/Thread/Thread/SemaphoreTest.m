//
//  SemaphoreTest.m
//  Thread
//
//  Created by Ju on 2021/1/28.
//

#import "SemaphoreTest.h"

@interface SemaphoreTest()

@property (nonatomic, strong) dispatch_semaphore_t ticketSemaphore; // 卖票串行队列
@property (nonatomic, strong) dispatch_semaphore_t moneySemaphore;  // 存取钱串行队列

@end

@implementation SemaphoreTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化
        _ticketSemaphore = dispatch_semaphore_create(1); // 初始一次只有一条线程可使用敏感数据（卖票操作）
        _moneySemaphore = dispatch_semaphore_create(1); // 初始一次只有一条线程可使用敏感数据（存取钱操作）
    }
    return self;
}

- (void)sellTicket {
    // 信号量-1
    dispatch_semaphore_wait(_ticketSemaphore, DISPATCH_TIME_FOREVER);
    [super sellTicket];
    // 信号量+1
    dispatch_semaphore_signal(_ticketSemaphore);
}

- (void)drawMoney {
    // 信号量-1
    dispatch_semaphore_wait(_moneySemaphore, DISPATCH_TIME_FOREVER);
    [super drawMoney];
    // 信号量+1
    dispatch_semaphore_signal(_moneySemaphore);
}

- (void)saveMoney {
    // 信号量-1
    dispatch_semaphore_wait(_moneySemaphore, DISPATCH_TIME_FOREVER);
    [super saveMoney];
    // 信号量+1
    dispatch_semaphore_signal(_moneySemaphore);
}

@end
