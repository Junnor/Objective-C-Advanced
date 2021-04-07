//
//  Cat.m
//  Super
//
//  Created by Ju on 2021/1/17.
//

#import "Cat.h"

@implementation Cat

- (void)eatFood {
    [super eatFood];
    
    NSLog(@"Cat eat");
}

- (void)sleep {
    NSLog(@"[self class] = %@", [self class]);
    NSLog(@"[self superclass] = %@", [self superclass]);
    NSLog(@"[super class] = %@", [super class]);
    NSLog(@"[super superclass] = %@", [super superclass]);
}

@end
