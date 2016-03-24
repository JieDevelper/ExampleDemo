//
//  JHomePageViewController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/22.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "JBaseAnimationController.h"

@interface JBaseAnimationController ()

@end

@implementation JBaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)operationButtonTitles {
    return @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
