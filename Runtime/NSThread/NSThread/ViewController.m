//
//  ViewController.m
//  NSThread
//
//  Created by Ju on 2021/1/16.
//

#import "ViewController.h"
#import "ZZThread.h"

@interface ViewController ()

@property (nonatomic, strong) ZZThread *thread;
@property (nonatomic, assign) Boolean stopThread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stopThread = false;
    
    __weak typeof(self) weakSelf = self;
    
    self.thread = [[ZZThread alloc] initWithBlock:^{
        NSLog(@"----- begin, thread = %@", [NSThread currentThread]);
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        
        /*  会永远运行
        [[NSRunLoop currentRunLoop] run]; // 类似下面代码：
        while (1) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
         */
        
        // 自己控制
        // 添加 while (weakSelf && ..） 防止vc被销毁了 !weakSelf.stopThread 执行为 true
        while (weakSelf && !weakSelf.stopThread) {
            NSLog(@"----- zzzzzzz, thread = %@, vc = %@", [NSThread currentThread], weakSelf);
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        NSLog(@"----- end, thread = %@", [NSThread currentThread]);

    }];
    [self.thread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // waitUntilDone:false 不等子线程执行完成，直接返回
    if (!self.thread) { return;}
    [self performSelector:@selector(zzThreadAction) onThread:self.thread withObject:nil waitUntilDone:false];
}

- (IBAction)stop:(id)sender {
    if (!self.thread) { return;}
    [self performSelector:@selector(stopThreadAction) onThread:self.thread withObject:nil waitUntilDone:false];
}

- (void)zzThreadAction {
    NSLog(@"----- %s, thread = %@", __func__, [NSThread currentThread]);
}

- (void)stopThreadAction {
    self.stopThread = true;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    NSLog(@"----- %s, thread = %@", __func__, [NSThread currentThread]);
    self.thread = nil;
}

- (void)incaseScrollBack {
    // waitUntilDone:true 等待子线程执行完成（先卡着）
    if (!self.thread) { return;}
    [self performSelector:@selector(stopThreadAction) onThread:self.thread withObject:nil waitUntilDone:true];
}

- (void)dealloc
{
    NSLog(@"----- %s", __func__);
    
    // 防止左滑返回，没有销毁;
    [self incaseScrollBack];
}


@end
