//
//  ViewController.m
//  KVC
//
//  Created by Ju on 2021/1/2.
//

#import "ViewController.h"


@interface Cat : NSObject {
    @public
    NSInteger _age;
    NSInteger _isAge;
    NSInteger age;
    NSInteger isAge;
}
// 把 age 属性注释掉，自己创建set 和 get 方法
//@property (nonatomic, assign) NSInteger age;

@end

@implementation Cat

// 赋值操作，优先级1
- (void)setAge:(NSInteger)age {
    _age = age;
}

- (void)_setAge:(NSInteger)age {
    _age = age;
}

// 取值操作，优先级1
- (NSInteger)getAge {
    return _age;
}

// 取值操作，优先级2
- (NSInteger)age {
    return _age;
}

// 取值操作，优先级3
- (NSInteger)isAge {
    return _age;
}

// 取值操作，优先级4
- (NSInteger)_age {
    return _age;
}

// 默认 true
+ (BOOL)accessInstanceVariablesDirectly {
    return true;
}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"----- willChangeValueForKey begin: %@", key);
    [super willChangeValueForKey:key];
    NSLog(@"----- willChangeValueForKey end: %@", key);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"----- didChangeValueForKey begin: %@", key);
    [super didChangeValueForKey:key];
    NSLog(@"----- didChangeValueForKey end: %@", key);
}

@end

@interface ViewController ()

@property (nonatomic, strong) Cat *cat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cat = [[Cat alloc] init];
    
    [self.cat setValue:@2 forKey:@"age"];
    
    
    NSLog(@"age = %@", [self.cat valueForKey:@"age"]);
}


@end
