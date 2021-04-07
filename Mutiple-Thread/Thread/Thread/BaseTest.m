//
//  BaseTest.m
//  Thread
//
//  Created by dq on 2021/1/28.
//

#import "BaseTest.h"

@interface BaseTest()

@property (nonatomic, assign) NSInteger ticketCount;
@property (nonatomic, assign) NSInteger totalMoney;

@end

@implementation BaseTest

- (void)ticketTest {
    self.ticketCount = 20;
    
    dispatch_queue_t ticketQueue = dispatch_queue_create("ticket queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 20; i ++) {
        dispatch_async(ticketQueue, ^{
            [self sellTicket];
        });
    }
}

- (void)moneyTest {
    self.totalMoney = 1000;
    
    dispatch_queue_t moneyQueue = dispatch_queue_create("money queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 20; i ++) {
        dispatch_async(moneyQueue, ^{
            i % 2 == 0 ? [self drawMoney] : [self saveMoney];
        });
    }
}

// 买票
- (void)sellTicket {
    NSInteger old = self.ticketCount;
    sleep(arc4random()%20*0.1); // 睡眠
    old --;
    self.ticketCount = old;
    NSLog(@"卖了一张票，剩余：%ld, 当前线程： %@", self.ticketCount, [NSThread currentThread]);
}

// 取钱
- (void)drawMoney {
    NSInteger old = self.totalMoney;
    sleep(arc4random()%20*0.1); // 睡眠
    old -= 50;
    self.totalMoney = old;
    NSLog(@"取钱50，剩余 %ld, 当前线程： %@", self.totalMoney, [NSThread currentThread]);
}

// 存钱
- (void)saveMoney {
    NSInteger old = self.totalMoney;
    sleep(arc4random()%20*0.1); // 睡眠
    old += 100;
    self.totalMoney = old;
    NSLog(@"存100，剩余 %ld, 当前线程： %@", self.totalMoney, [NSThread currentThread]);
}

@end
