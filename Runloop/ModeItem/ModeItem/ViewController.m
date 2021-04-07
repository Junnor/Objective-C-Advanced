//
//  ViewController.m
//  ModeItem
//
//  Created by Ju on 2021/1/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    __weak typeof(self) weakSelf = self;
    self.thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"xxx");
        
        // __CFRunLoopDoTimer
//        NSTimer *timer = [NSTimer timerWithTimeInterval:3 repeats:false block:^(NSTimer * _Nonnull timer) {
//            [weakSelf timerTest];
//        }];
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    }];
    [self.thread start];

    
//    [self source0Test];
    
//    [self source1Test];

    [self dispatchRun];

}

// __CFRunLoopDoSources0
- (void)source0Test {
    [self performSelector:@selector(run) onThread:self.thread withObject:nil waitUntilDone:true];
}

// __CFRunLoopDoTimer
- (void)source1Test {
    [self performSelector:@selector(run) withObject:nil afterDelay:3];
}

// __CFRunLoopDoSource0
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self run];
}

// 自定义的 [DISPATCH_QUEUE_CONCURRENT queue] async back to main quque
// __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__  Source1
- (void)dispatchRun {
    dispatch_async(dispatch_queue_create("custom_queue", DISPATCH_QUEUE_CONCURRENT), ^{
        NSLog(@"task in: %@", [NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"main task in: %@", [NSThread currentThread]);
        });
    });
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)run {
    NSLog(@"%s", __func__);
}


@end
