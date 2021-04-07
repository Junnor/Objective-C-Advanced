//
//  ViewController.m
//  MutipleThread
//
//  Created by Ju on 2021/1/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self noBlockMainQueue];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue1 = dispatch_queue_create("queue-concurrent-1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("queue-concurrent-2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_queue_create("queue-concurrent-3", DISPATCH_QUEUE_CONCURRENT);

    dispatch_group_async(group, queue1, ^{
        NSLog(@"Asycn task 1, thread = %@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue2, ^{
        NSLog(@"Asycn task 2, thread = %@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue3, ^{
        NSLog(@"Asycn task 3, thread = %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"All task done, thread = %@", [NSThread currentThread]);
    });

}


- (void)mainQueue {
    
    // 系统默认的主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
        
    // 主队列不开启其它线程执行异步任务，直接在主线程执行
    dispatch_async(queue, ^{
        // 输出： Async task, thread = <NSThread: 0x6000035f89c0>{number = 1, name = main}
        NSLog(@"Async task, thread = %@", [NSThread currentThread]);
    });
    
    // 主队列添加同步任务，造成任务间的互相等待，导致死锁，崩溃
    /*
    dispatch_sync(queue, ^{
        NSLog(@"Sync task, thread = %@", [NSThread currentThread]);
    });*/
}

- (void)noBlockMainQueue {
    // 添加异步任务到全局并发队列
    // 开启子线程异步执行任务
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
        NSLog(@"Async task, thread = %@", [NSThread currentThread]);
        
        // 添加同步任务到主队列
        // 从子线程回到主线程
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"Sync task, thread = %@", [NSThread currentThread]);
        });
    });
}

- (void)globalQueue {
    // 系统默认的全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
    
    // 由于是在主线程添加测试代码的，所以当前线程是主线程，不开启子线程执行这个同步任务
    dispatch_sync(queue, ^{
        // 输出： Sync task, thread = <NSThread: 0x6000036b0a00>{number = 1, name = main}
        NSLog(@"Sync task, thread = %@", [NSThread currentThread]);
    });

    // 开启子线程异步执行任务
    dispatch_async(queue, ^{
        // 输出： Async task, thread = <NSThread: 0x60000225e0c0>{number = 7, name = (null)}
        NSLog(@"Async task, thread = %@", [NSThread currentThread]);
    });
    
}


@end
