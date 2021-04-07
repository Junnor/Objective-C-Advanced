//
//  Cat+White.m
//  Category
//
//  Created by Ju on 2021/1/3.
//

#import "Cat+White.h"
#import "Kitten.h"

@implementation Cat (White)

//+ (void)initialize
//{
//    if (self == [Kitten class]) {
//        NSLog(@"Cat (White) Kitten initialize");
//    } else {
//        NSLog(@"Cat (White) initialize");
//    }
//}

+ (void)load {
    NSLog(@"Cat (White) +load");
}

+ (void)run {
    NSLog(@"Cat (White) +run");
}

@end
