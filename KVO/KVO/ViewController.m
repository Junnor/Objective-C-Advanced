//
//  ViewController.m
//  KVO
//
//  Created by Ju on 2020/12/31.
//

#import "ViewController.h"
#import <objc/runtime.h>

// ----------------------- Cat -----------------------

@interface Cat : NSObject{
    @public
    NSInteger _age;
}

@property (nonatomic, assign) NSInteger age;

@end

@implementation Cat

- (void)setAge:(NSInteger)age {
    _age = age;
    NSLog(@"-----setAge:");
}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"-----willChangeValueForKey: begin");
    [super willChangeValueForKey:key];
    NSLog(@"-----willChangeValueForKey: end");
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"-----didChangeValueForKey: begin");
    [super didChangeValueForKey:key];
    NSLog(@"-----didChangeValueForKey: end");
}

@end
// ----------------------- ViewController -----------------------

@interface ViewController ()

@property (nonatomic, strong) Cat *whiteCat;
@property (nonatomic, strong) Cat *blackCat;

@end

@implementation ViewController

// ... 其它代码
// ... 其它代码
// ... 其它代码

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.whiteCat = [[Cat alloc] init];
    self.whiteCat.age = 2;
    
    self.blackCat = [[Cat alloc] init];
    self.blackCat.age = 3;
    
    NSLog(@"添加KVO前： whiteCat = %@, pointer = %p, blackCat = %@ ,pointer = %p", [self.whiteCat class], [self.whiteCat class], [self.blackCat class], [self.blackCat class]);
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.whiteCat addObserver:self forKeyPath:@"age" options:options context:@"Kitten"];
    
    NSLog(@"添加KVO后： whiteCat = %@, pointer = %p, blackCat = %@ ,pointer = %p", [self.whiteCat class], [self.whiteCat class], [self.blackCat class], [self.blackCat class]);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == @"Kitten") {
        NSLog(@"KVO监听 %@, %@, %@", object, keyPath, change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.whiteCat.age = 5;
}

- (void)dealloc {
    [self.whiteCat removeObserver:self forKeyPath:@"age"];
}

@end
