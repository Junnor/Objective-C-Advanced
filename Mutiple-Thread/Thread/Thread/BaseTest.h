//
//  BaseTest.h
//  Thread
//
//  Created by dq on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTest : NSObject

- (void)ticketTest;
- (void)moneyTest;

// 子类覆盖测试
- (void)sellTicket;
- (void)drawMoney;
- (void)saveMoney;

@end

NS_ASSUME_NONNULL_END
