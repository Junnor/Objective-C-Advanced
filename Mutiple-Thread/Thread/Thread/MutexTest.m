//
//  MutexTest.m
//  Thread
//
//  Created by Ju on 2021/1/29.
//

#import "MutexTest.h"
#import <pthread.h>

@interface MutexTest()

@property (nonatomic, assign) pthread_mutex_t ticketMutex;
@property (nonatomic, assign) pthread_mutex_t moneyMutex;

@end

@implementation MutexTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化
        [self configureMutex:&_ticketMutex];
        [self configureMutex:&_moneyMutex];
    }
    return self;
}

- (void)configureMutex:(pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL); // 普通类型
    // 初始化锁
    pthread_mutex_init(mutex,  &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
}

- (void)sellTicket {
    pthread_mutex_lock(&_ticketMutex);
    [super sellTicket];
    pthread_mutex_unlock(&_ticketMutex);
}

- (void)drawMoney {
    pthread_mutex_lock(&_moneyMutex);
    [super drawMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)saveMoney {
    pthread_mutex_lock(&_moneyMutex);
    [super saveMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

// 销毁
- (void)dealloc {
    pthread_mutex_destroy(&_ticketMutex);
    pthread_mutex_destroy(&_moneyMutex);
}

@end
