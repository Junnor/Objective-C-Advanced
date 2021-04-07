//
//  main.m
//  Cache
//
//  Created by Ju on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cat *cat = [[Cat alloc] init];
        [cat performSelector:@selector(eat)];
    }
    return 0;
}
