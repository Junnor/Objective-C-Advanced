//
//  Cat.m
//  Category
//
//  Created by Ju on 2021/1/3.
//

#import "Cat.h"
#import "Kitten.h"

@implementation Cat

+ (void)initialize
{
    NSLog(@"xxxx %@", [self class]);
    if (self == [Kitten class]) {
        NSLog(@"Kitten initialize");
    } else {
        NSLog(@"Cat initialize");
    }
}

+ (void)load {
    NSLog(@"Cat +load");
}

+ (void)run {
    NSLog(@"Cat +run");
}

@end
