//
//  Cat.m
//  Cache
//
//  Created by Ju on 2021/1/14.
//

#import "Cat.h"
#import <objc/runtime.h>

@interface Dog : NSObject

- (void)eat;

@end

@implementation Dog

- (void)eat {
    NSLog(@"Eat dog food");
}

@end

@implementation Cat

// 方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(eat)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//// 签名后的查看
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 这里可以拦截所有这个类的找不到的方法，这样就可以消息找不到的时候也不崩溃了
    NSLog(@"没有实现方法: %s", anInvocation.selector);
}
//
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(eat)) {
        return [[Dog alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)run {
    NSLog(@"%s", __func__);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(eat)) {
//        Method method = class_getInstanceMethod(self, @selector(lotOfFish));
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//        return true;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//- (void)lotOfFish{
//    NSLog(@"%s", __func__);
//}

//+ (BOOL)resolveClassMethod:(SEL)sel



@end
