//
//  ViewController.m
//  ThreadLive
//
//  Created by Ju on 2021/1/19.
//

#import "ViewController.h"
#import "ZZThread.h"

@interface ViewController ()

@property (nonatomic, strong) ZZThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[ZZThread alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"task - %@", [NSThread currentThread]);
    }];
}

- (void)dealloc {
    // 也可以主动在不想要 thread 以后，自己调用 [thread stop]
    [self.thread stop];
}

@end
