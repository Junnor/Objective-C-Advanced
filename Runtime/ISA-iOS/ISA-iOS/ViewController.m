//
//  ViewController.m
//  ISA-iOS
//
//  Created by Ju on 2021/1/13.
//

#import "ViewController.h"
#import "Cat.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Cat *cat = [[Cat alloc] init];
    cat.age = 5;
    
    Cat *tmp1 = cat;
//    Cat *tmp2 = cat;
//    Cat *tmp3 = cat;

    NSLog(@"cat 对象地址：%p", cat);
    NSLog(@"Cat 类地址：%p", object_getClass(cat));

//    objc_setAssociatedObject(cat, @"catName", @"Tom", OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    NSLog(@"xxxx");
}


@end
