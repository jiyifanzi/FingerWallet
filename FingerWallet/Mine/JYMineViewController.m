//
//  JYMineViewController.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYMineViewController.h"

@interface JYMineViewController ()

@property (nonatomic, strong) UITableView * tableView;

//  头部视图
@property (nonatomic, strong) UIView * headerView;
//  头像
@property (nonatomic, strong) UIImageView * headIcon;
//  积分板块
@property (nonatomic, strong) UIView * oneView;


//  认证模块
@property (nonatomic, strong) UIView * twoView;

@end

@implementation JYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
