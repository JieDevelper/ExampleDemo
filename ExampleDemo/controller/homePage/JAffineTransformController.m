//
//  JAffineTransformController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "JAffineTransformController.h"

@interface JAffineTransformController()

@end

@implementation JAffineTransformController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)operationButtonTitles {
    return @[@"位移",@"缩放",@"旋转",@"组合",@"反转"];
}
@end
