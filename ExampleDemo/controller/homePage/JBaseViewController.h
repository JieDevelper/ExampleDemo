//
//  JBaseViewController.h
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "JPublic_Heard.h"

@interface JBaseViewController : UIViewController

//导航栏title
@property (nonatomic, copy) NSString *textTitle;

//底下操作按钮title
@property (nonatomic, strong) NSArray *operationButtonTitles;


@end
