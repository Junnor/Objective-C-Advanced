//
//  main.m
//  Runtime
//
//  Created by Ju on 2021/1/17.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Cat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 类
        NSLog(@"NSObject isKindOfClass NSObject: %d", [NSObject isKindOfClass:[NSObject class]]); // 1
        NSLog(@"NSObject isMemberOfClass NSObject: %d", [NSObject isMemberOfClass:[NSObject class]]); // 0
        NSLog(@"Cat class isKindOfClass Cat: %d", [Cat isKindOfClass:[Cat class]]);  // 0
        NSLog(@"Cat class isMemberOfClass Cat: %d", [Cat isMemberOfClass:[Cat class]]); // 0

        NSLog(@"------------------");
        
        // 对象
        // 继承关系 Cat: NSObject
        Cat *cat = [[Cat alloc] init];
        NSLog(@"cat instance isKindOfClass NSObject: %d", [cat isKindOfClass:[NSObject class]]);  // 1
        NSLog(@"cat instance isMemberOfClass NSObject: %d", [cat isMemberOfClass:[NSObject class]]); // 0
        NSLog(@"cat instance isKindOfClass Cat: %d", [cat isKindOfClass:[Cat class]]);  // 1
        NSLog(@"cat instance isMemberOfClass Cat: %d", [cat isMemberOfClass:[Cat class]]); // 1
    }
    return 0;
}
