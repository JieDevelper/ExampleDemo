//
//  JAffineTransformController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "JAffineTransformController.h"

@interface JAffineTransformController()

@property (nonatomic , strong) UIView *demoView;
@end

@implementation JAffineTransformController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.demoView];
}

- (NSArray *)operationButtonTitles {
    return @[@"位移",@"缩放",@"旋转",@"组合",@"反转"];
}

//UI开发技巧，重写setter方法和Code Block Evaluation C Extension语法
- (UIView *)demoView{
    if (!_demoView) {
        _demoView = ({
            UIView *demoView = [[UIView alloc] initWithFrame:({
                CGRect rect = CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100,100 ,100 );
                rect;
            })];
            demoView.backgroundColor = [UIColor redColor];
            demoView;
        });
    }
    return _demoView;
}

- (void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotateAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self invertAnimation];
            break;
        default:
            break;
    }
}

- (void)positionAnimation{
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _demoView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];
}

- (void)scaleAnimation{
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _demoView.transform = CGAffineTransformMakeScale(2, 2);
    }];
}

- (void)rotateAnimation{
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _demoView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

- (void)combinationAnimation{
    //仿射变换的组合使用
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        _demoView.transform = CGAffineTransformTranslate(transform2, 100, 100);
    }];
}

- (void)invertAnimation{
    _demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        //矩阵反转
        _demoView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
    }];
}

- (NSString *)textTitle{
    return @"仿射变换";
}

@end
