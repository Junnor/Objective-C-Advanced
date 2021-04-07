//
//  ViewController.m
//  Thread
//
//  Created by dq on 2021/1/28.
//

#import "ViewController.h"
#import "BaseTest.h"
#import "SerialQueueTest.h"
#import "SemaphoreTest.h"
#import "MutexTest.h"
#import "LockTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LockTest *test = [[LockTest alloc] init];
    
//    [test ticketTest];
//    [test moneyTest];
    
    [self dispatchBarrierTaskTest];
}

// dispatch_barrier_async

- (void)dispatchBarrierTaskTest {
    
    dispatch_queue_t queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [self read];
    });
    dispatch_async(queue, ^{
        [self read];
    });
    dispatch_async(queue, ^{
        [self read];
    });
    dispatch_barrier_async(queue, ^{
        // 保证在之前添加队列的任务都执行完毕再执行这个任务
        // 之后添加到队列的任务要等这个栏栅任务结束以后才能开始执行
        [self write];
    });
    dispatch_async(queue, ^{
        [self read];
    });
    dispatch_async(queue, ^{
        [self read];
    });
}

- (void)read {
    sleep(1);
    NSLog(@"read");
}

- (void)write {
    sleep(1);
    NSLog(@"write");
}


@end
