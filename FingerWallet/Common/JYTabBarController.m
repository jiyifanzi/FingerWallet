//
//  JYTabBarController.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYTabBarController.h"


//  借款
#import "JYBrowerViewController.h"
//  还款
#import "JYReturnViewController.h"
//  我的
#import "JYMineViewController.h"

@interface JYTabBarController ()

@property (nonatomic, strong) JYBrowerViewController * browerMoney;
@property (nonatomic, strong) JYReturnViewController * returnMoney;
@property (nonatomic, strong) JYMineViewController * mine;

@end

@implementation JYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self initSubViewVCs];
}


#pragma mark - 初始化自控制器
- (void)initSubViewVCs {
    _browerMoney = [[JYBrowerViewController alloc] init];
    [self setupChildViewController:@"借款" viewController:_browerMoney image:@"brower" selectedImage:@"brower_sl"];
    
    _returnMoney = [[JYReturnViewController alloc] init];
    [self setupChildViewController:@"还款" viewController:_returnMoney image:@"return" selectedImage:@"return_sl"];
    
    _mine = [[JYMineViewController alloc] init];
    [self setupChildViewController:@"我的" viewController:_mine image:@"mine" selectedImage:@"mine_sl"];
}

#pragma mark - 添加子视图
- (void)setupChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.title = title;
    controller.tabBarItem = item;
    controller.title = title;
    
    JYBaseNavigationController *naController = [[JYBaseNavigationController alloc]initWithRootViewController:controller];
    
    [naController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [UIFont systemFontOfSize:11 weight:UIFontWeightBold], NSFontAttributeName,
                                                     [UIColor lightGrayColor],NSForegroundColorAttributeName,
                                                     nil] forState:UIControlStateNormal];
    [naController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                     [UIFont systemFontOfSize:11 weight:UIFontWeightBold],NSFontAttributeName,
                                                     [UIColor colorWithRed:135/255.0 green:120/255.0 blue:125/255.0 alpha:1.0],NSForegroundColorAttributeName,
                                                     nil]  forState:UIControlStateSelected];
    
    [self addChildViewController:naController];
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
