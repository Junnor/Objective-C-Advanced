//
//  main.m
//  Category
//
//  Created by Ju on 2021/1/3.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Cat.h"
#import "Kitten.h"

// 主要是使用runtime输出看看
void printMethodsNameForClass(Class cls) {
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableString *methodsName = [NSMutableString string];
    for (int i = 0; i < count; i ++) {
        Method item = methodList[i];
        NSString *methodName = NSStringFromSelector(method_getName(item));
        [methodsName appendFormat:@"\n%@", methodName];
    }
    free(methodList);
    NSLog(@"class = %@, methods = %@", cls, methodsName);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        printMethodsNameForClass(object_getClass([Cat class]));
        [Kitten alloc];
    }
    return 0;
}
