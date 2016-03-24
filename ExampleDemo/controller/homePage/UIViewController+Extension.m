//
//  UIViewController+Extension.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>
#import "SWRevealViewController.h"

@implementation UIViewController (Extension)
/*
+ (void) initialize {
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        Method orginMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
        Method swizzleMethod = class_getInstanceMethod([self class], @selector(swizzle_viewDidLoad));
        SEL orginSel = method_getName(orginMethod);
        SEL swizzleSel = method_getName(swizzleMethod);
        
        BOOL addMethod = class_addMethod([self class], orginSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
        if (addMethod) {
            class_addMethod([self class], swizzleSel, method_getImplementation(orginMethod), method_getTypeEncoding(orginMethod));
        }else{
            method_exchangeImplementations(orginMethod, swizzleMethod);
        }
    });
}

- (void)swizzle_viewDidLoad {
    self.view.backgroundColor = [UIColor redColor];
    if (![self isKindOfClass:[SWRevealViewController class]]) {
        [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    [self swizzle_viewDidLoad];
}
*/
@end
