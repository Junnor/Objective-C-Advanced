//
//  SerialQueueTest.m
//  Thread
//
//  Created by dq on 2021/1/28.
//

#import "SerialQueueTest.h"

@interface SerialQueueTest()

@property (nonatomic, strong) dispatch_queue_t serialTicketQueue; // 卖票串行队列
@property (nonatomic, strong) dispatch_queue_t serialMoneyQueue;  // 存取钱串行队列

@end

@implementation SerialQueueTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化
        _serialTicketQueue = dispatch_queue_create("ticket serial queue", DISPATCH_QUEUE_SERIAL);
        _serialMoneyQueue = dispatch_queue_create("money serial queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

// 重写父类的卖票，把卖票操作添加到串行队列
- (void)sellTicket {
    dispatch_sync(self.serialTicketQueue, ^{
        [super sellTicket];
    });
}

// 重写父类的取钱，把取钱操作添加到串行队列
- (void)drawMoney {
    dispatch_sync(self.serialMoneyQueue, ^{
        [super drawMoney];
    });
}

// 重写父类的存钱，把存钱操作添加到串行队列
- (void)saveMoney {
    dispatch_sync(self.serialMoneyQueue, ^{
        [super saveMoney];
    });
}

@end
