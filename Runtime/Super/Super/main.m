//
//  main.m
//  Super
//
//  Created by Ju on 2021/1/17.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cat *cat = [[Cat alloc] init];
        [cat sleep];
    }
    return 0;
}
