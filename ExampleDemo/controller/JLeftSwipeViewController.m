//
//  JLeftSwipeViewController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/22.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "JLeftSwipeViewController.h"
#import "JPublic_Heard.h"
#import "SWRevealViewController.h"
#import "JBaseAnimationController.h"
#import "JKeyFrameAnimationController.h"
#import "JGroupAnimationController.h"
#import "JTransitionAnimationController.h"
#import "JAffineTransformController.h"
#import "JComprehensiveCaseController.h"

@interface JLeftSwipeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataAarray;

@end

@implementation JLeftSwipeViewController

- (NSArray *)dataAarray {
    if (_dataAarray == nil) {
        _dataAarray = @[@"基础动画",@"关键帧动画",@"组动画",@"过渡动画",@"仿射变换",@"综合案例"];
    }
    return _dataAarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self setupSubViews];
}

- (void)setupSubViews {
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //self.tableView.frame = self.view.bounds;
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20);
        make.left.right.bottom.equalTo(self.view);
        
    }];
    self.tableView.tableFooterView = [[UIView alloc] init];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataAarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
    cell.textLabel.text = self.dataAarray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SWRevealViewController *sw = self.revealViewController;
    UIViewController *vc;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
    switch (indexPath.row) {
        case 0:
            vc = [[JBaseAnimationController alloc] init];
            break;
        case 1:
            vc = [[JKeyFrameAnimationController alloc] init];
            break;
        case 2:
            vc = [[JGroupAnimationController alloc] init];
            break;
        case 3:
            vc = [[JTransitionAnimationController alloc] init];
            break;
        case 4:
            vc = [[JAffineTransformController alloc] init];
            break;
        case 5:
            vc = [[JComprehensiveCaseController alloc] init];
            break;
        default:
            break;
    }
    
    if (sw) {
        [sw pushFrontViewController:vc animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
