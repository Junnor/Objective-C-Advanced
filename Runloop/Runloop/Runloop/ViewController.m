//
//  ViewController.m
//  Runloop
//
//  Created by Ju on 2021/1/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    static int count = 0;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        NSLog(@"count = %d", ++count);
    }];
    
    /*
     如果只是添加到 UITrackingRunLoopMode 或者 NSDefaultRunLoopMode 模式，
     那么 count 的输出就只能在一种模式运行了，要想滚动情况和非滚动情况都执行 count 输出，
     需要添加到标记为通用模式的 NSRunLoopCommonModes
    */
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    // 创建 Observer
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
//                                                                       kCFRunLoopAllActivities,
//                                                                       true,
//                                                                       0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        switch (activity) {
//            case kCFRunLoopEntry:
//                NSLog(@"kCFRunLoopEntry");
//                break;
//            case kCFRunLoopBeforeSources:
//                NSLog(@"kCFRunLoopBeforeSources");
//                break;
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"kCFRunLoopBeforeTimers");
//                break;
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"kCFRunLoopBeforeWaiting");
//                break;
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"kCFRunLoopAfterWaiting");
//                break;
//            case kCFRunLoopExit:
//                NSLog(@"kCFRunLoopExit");
//                break;
//            default:
//                break;
//        }
//    });
//
//    // 添加到当前 Runloop
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
//
//    CFRelease(observer); // C 语言的创建使用 create 或者 copy 的释放一下
//}


//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    // 创建 Observer
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
//                                                                       kCFRunLoopAllActivities,
//                                                                       true,
//                                                                       0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        switch (activity) {
//            case kCFRunLoopEntry: {
//                // 查看某个 Mode 的开发
//                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//                NSLog(@"kCFRunLoopEntry - %@", mode);
//                CFRelease(mode);
//                break;
//            }
//            case kCFRunLoopExit: {
//                // 查看某个 Mode 的结束
//                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//                NSLog(@"kCFRunLoopExit - %@", mode);
//                CFRelease(mode);
//                break;
//            }
//            default:
//                // 其它状态忽略
//                break;
//        }
//    });
//
//    // 添加到当前 Runloop, 记得标记为 kCFRunLoopCommonModes （包含 UITrackingRunLoopMode | NSDefaultRunLoopMode）
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
//
//    CFRelease(observer); // C 语言的创建使用 create 或者 copy 的释放一下
//}


@end
