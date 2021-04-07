//
//  main.m
//  ISA-iOS
//
//  Created by Ju on 2021/1/13.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Cat.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
