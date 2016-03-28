//
//  JHomePageViewController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/22.
//  Copyright © 2016年 zj. All rights reserved.
//



#import "JBaseAnimationController.h"


@interface JBaseAnimationController ()

@property (nonatomic, strong) UIView *demoView;

@end

@implementation JBaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    _demoView = [[UIView alloc] init];
    [self.view addSubview:_demoView];
    self.demoView.backgroundColor = [UIColor redColor];
    
    [self.demoView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(80));
        make.height.equalTo(@(80));
        make.center.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)textTitle {
    return @"基础动画";
}

- (NSArray *)operationButtonTitles {
    return @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)positionAnimation {
    //基础动画.(属性动画)
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:self.view.center];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(_demoView.center.x, 300)];
    basicAnimation.duration = 1.0f;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:basicAnimation forKey:@"positionAnimation"];
}

- (void)opacityAniamtion {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
    ani.fromValue = @(1.0);
    ani.toValue = @(0.2);
    ani.duration = 1.0f;
    [self.demoView.layer addAnimation:ani forKey:@"opacityAniamtion"];
}

- (void)scaleAnimation {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ani.toValue = @(2);
    ani.duration = 1.0f;
    [self.demoView.layer addAnimation:ani forKey:@"scaleAnimation"];
}

- (void)rotateAnimation {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    ani.toValue = @(M_PI);
    ani.duration = 1.0f;
    [self.demoView.layer addAnimation:ani forKey:@"rotateAnimation"];
}

- (void)backgroundAnimation {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    ani.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    ani.duration = 1.0f;
    [self.demoView.layer addAnimation:ani forKey:@"backgroundAnimation"];
}

@end
