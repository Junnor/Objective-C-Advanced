//
//  ZZThread.m
//  ThreadLive
//
//  Created by Ju on 2021/1/19.
//

#import "ZZThread.h"

@interface TestThread : NSThread
@end
@implementation TestThread
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

@interface ZZThread()

@property (strong, nonatomic) TestThread *realThread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;

@end

@implementation ZZThread

- (instancetype)init {
    if (self = [super init]) {
        self.stopped = NO;
        
        __weak typeof(self) weakSelf = self;
        
        self.realThread = [[TestThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        
        [self.realThread start];
    }
    return self;
}

- (void)executeTask:(ZZThreadTask)task {
    if (!self.realThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.realThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.realThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.realThread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self stop];
}

#pragma mark - private

- (void)__stop
{
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.realThread = nil;
}

- (void)__executeTask:(ZZThreadTask)task
{
    task();
}

@end
