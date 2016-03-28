//
//  JHomePageViewController.h
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/22.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBaseViewController.h"

typedef NS_ENUM(NSInteger, SEX_TYPE) {
    SEX_TYPE_MAN = 0,
    SEX_TYPE_WOMAN = 1
};

typedef void(^myblock)(NSArray *);

@interface JBaseAnimationController : JBaseViewController

@property (nonatomic, copy) myblock block;

@end
