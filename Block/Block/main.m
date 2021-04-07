//
//  main.m
//  Block
//
//  Created by dq on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "Cat.h"


//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//
//struct __Block_byref_age_0 {
//    void *__isa;
//    struct __Block_byref_age_0 *__forwarding;
//    int __flags;
//    int __size;
//    int age;
//};
//
//
//struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//    void (*copy);
//    void (*dispose);
//};
//
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    struct __Block_byref_age_0 *age; // by ref
//};

//struct __Block_byref_cat_0 {
//    void *__isa;
//    struct __Block_byref_cat_0 *__forwarding;
//    int __flags;
//    int __size;
//    void (*__Block_byref_id_object_copy)(void*, void*);
//    void (*__Block_byref_id_object_dispose)(void*);
//    Cat *__strong cat; // 强引用 cat， 当然如果是这样声明 __block __weak Cat *cat = [[Cat alloc] init];， 那么就是 Cat *__weak cat
//};


//struct __block_impl {
//    void *isa; // isa 指针，表明是个对象
//    int Flags;
//    int Reserved;
//    void *FuncPtr; // 函数实现地址
//};
//
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//};
//
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    int milk; // 值传递
//    int *egg; // 引用传递
//};
//
//
//// auto 全局变量
//int orange = 6;
//
//// static 全局变量
//static int banana = 5;


//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//    void (*copy);
//    void (*dispose);
//}
//
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    Cat *__strong cat;
//};


typedef void (^BananaBlock)(void);
typedef void (^AppleBlock)(void);

// 全局变量
int treeHeight = 100;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 局部变量 auto 变量。如果是 static int 那么它是一个静态类型变量，会存在全局数据区
        int count = 2;
        
        // 不是 auto 变量，是 static 类型， 输出： __NSGlobalBlock__
        static int age = 2;
        BananaBlock ageBlock = ^{
            NSLog(@"ageBlock age = %d", age);
        };
        NSLog(@"ageBlock class = %@", [ageBlock class]);

        // 访问了局部变量 ... 为 __NSStackBlock__ 类型
        BananaBlock bananaBlock = ^{
            NSLog(@"bananaBlock count = %d, treeHeight = %d", count, treeHeight);
        };
        
        // 没访问局部变量 ... 为 __NSGlobalBlock__ 类型
        AppleBlock appleBlock = ^{
            NSLog(@"appleBlock treeHeight = %d", treeHeight);
        };
        
        // 访问了局部变量 ... 为 __NSStackBlock__ 类型
        void(^orangeBlock)(void) = ^{
            NSLog(@"orangeBlock count = %d", count);
        };
        
        // 访问了局部变量，并且添加了 copy 操作 ... 为 __NSMallocBlock__ 类型
        void(^cherryBlock)(void) = [^{
            NSLog(@"cherryBlock count = %d", count);
        } copy];
        
        // 什么变量都没访问 ... 为 __NSGlobalBlock__ 类型
        void(^normalBlock)(void) = ^{
            NSLog(@"Nothing");
        };
        
        NSLog(@"ageBlock class = %@", [ageBlock class]);
        NSLog(@"bananaBlock class = %@", [bananaBlock class]);
        NSLog(@"appleBlock class = %@", [appleBlock class]);
        NSLog(@"orangeBlock class = %@", [orangeBlock class]);
        NSLog(@"cherryBlock class = %@", [cherryBlock class]);
        NSLog(@"normalBlock class = %@", [normalBlock class]);
    }
    return 0;
}
