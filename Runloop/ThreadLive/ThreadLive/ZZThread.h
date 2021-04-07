//
//  ZZThread.h
//  ThreadLive
//
//  Created by Ju on 2021/1/19.
//

#import <Foundation/Foundation.h>

typedef void (^ZZThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN

@interface ZZThread : NSObject

// 在当前子线程执行一个任务
- (void)executeTask:(ZZThreadTask)task;

// 结束线程
- (void)stop;

@end

NS_ASSUME_NONNULL_END
