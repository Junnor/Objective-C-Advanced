//
//  Cat.m
//  Block
//
//  Created by dq on 2021/1/5.
//

#import "Cat.h"

@implementation Cat

// 辅助打印，看 cat 对象是否销毁了
- (void)dealloc {
    [super dealloc]; // MRC 需要调用 super
    NSLog(@"Cat dealloc");
}

@end
