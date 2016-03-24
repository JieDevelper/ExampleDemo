//
//  JBaseViewController.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/23.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "JBaseViewController.h"
#define kButtonMargin   10
#define kButtonHeight   30


@interface JBaseViewController()

@property (nonatomic, strong) NSMutableArray *opertionButtons;

@end

@implementation JBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (NSMutableArray *)opertionButtons {
    if (_opertionButtons == nil) {
        _opertionButtons = [NSMutableArray array];
    }
    return _opertionButtons;
}

- (void)initUI {
    self.view.backgroundColor= [UIColor whiteColor];
    [self.view addGestureRecognizer:[self.revealViewController tapGestureRecognizer]];
    [self.view addGestureRecognizer:[self.revealViewController panGestureRecognizer]];
    
    // add navgation bar;
    UIView *navagtionBar = [[UIView alloc] init];
    navagtionBar.backgroundColor = [UIColor cyanColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.textTitle;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //titleLabel.backgroundColor = [UIColor blueColor];
    
    [navagtionBar addSubview:titleLabel];
    [self.view addSubview:navagtionBar];
    
    //layout
    [navagtionBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@(60));
    }];
    
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(200);
        make.height.equalTo(30);
        make.centerX.equalTo(navagtionBar.centerX);
        make.bottom.equalTo(navagtionBar).offset(0);
    }];
    
    for(NSString *title in self.operationButtonTitles) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:title forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor grayColor]];
        [self.opertionButtons addObject:button];
        [self.view addSubview:button];
    }
    
    //layout buttons
    UIButton *preButton;
    int col = 4;
    for (int i = 0; i<self.opertionButtons.count; i++) {
        UIButton *button = self.opertionButtons[i];
        if (preButton) {
            [button makeConstraints:^(MASConstraintMaker *make) {
                if ((i + 1) % col == 0 || ((i+1) == self.opertionButtons.count && i < 4)) {
                    make.right.equalTo(self.view).offset(-kButtonMargin);
                }
                
                if (i % col == 0) {
                    make.left.equalTo(kButtonMargin);
                    make.bottom.equalTo(preButton.top).offset(-kButtonMargin);
                }else{
                    make.bottom.equalTo(preButton);
                    make.left.equalTo(preButton.right).offset(kButtonMargin);
                }
                
                make.width.equalTo(preButton);
                make.height.equalTo(preButton);
            }];
            
        }else {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(kButtonMargin);
                make.bottom.equalTo(self.view).offset(-kButtonMargin);
                make.height.equalTo(kButtonHeight);
            }];
        }

        preButton = button;
    }
}

- (void)dealloc {
    NSLog(@"%@ dealloc",[self class]);
}

@end
