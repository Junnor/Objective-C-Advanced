//
//  main.m
//  ISA
//
//  Created by Ju on 2021/1/13.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cat *cat = [[Cat alloc] init];
        NSLog(@"%p", cat);
        
        __weak typeof(cat) weakCat = cat;
    }
    return 0;
}
