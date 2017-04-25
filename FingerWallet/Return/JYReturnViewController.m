//
//  JYReturnViewController.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYReturnViewController.h"

#import "JYRMoneyTableViewCell.h"

@interface JYReturnViewController () <UITableViewDelegate, UITableViewDataSource>

//  头图
@property (nonatomic, strong) UIView * headerView;

//  左视图
@property (nonatomic, strong) UIView * leftView;
//  封面
@property (nonatomic, strong) UIImageView * coverImage;
//  右视图
@property (nonatomic, strong) UIView * rightView;
//  待还款
@property (nonatomic, strong) UILabel * returnMoney;
//  代还款时间
@property (nonatomic, strong) UILabel * returnTime;
//  提前还款按钮
@property (nonatomic, strong) UIButton * returnBtn;

//  主视图
@property (nonatomic, strong) UITableView * tableView;


@end

@implementation JYReturnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigation];
    
    [self setupTableView];
}

#pragma mark - 创建主视图
- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self setupHeaderView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"JYRMoneyTableViewCell" bundle:nil] forCellReuseIdentifier:@"rMoney"];
}

#pragma mark - 定制头饰图
- (void)setupHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWight, 200)];
    self.tableView.tableHeaderView = _headerView;
    _headerView.backgroundColor = [UIColor whiteColor];
    
    _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headerView addSubview:_returnBtn];
    
    [self.returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerView).offset(-10);
        make.left.equalTo(self.headerView).offset(20);
        make.right.equalTo(self.headerView).offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    [_returnBtn setTitle:@"申请借款" forState:UIControlStateNormal];
    [_returnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _returnBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _returnBtn.clipsToBounds = YES;
    _returnBtn.layer.cornerRadius = 5;
    _returnBtn.backgroundColor = JYColorFromRGB(81, 180, 245);
    
    
    UIView * niceView = [[UIView alloc] init];
    [self.headerView addSubview:niceView];
    [niceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView);
        make.top.equalTo(self.headerView);
        make.bottom.equalTo(self.returnBtn.mas_top);
        make.width.mas_offset(0.5f);
    }];
    
    
    _leftView = [[UIView alloc] init];
    [self.headerView addSubview:_leftView];
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView);
        make.top.equalTo(self.headerView);
        make.bottom.equalTo(niceView);
        make.right.equalTo(niceView);
    }];
    _leftView.backgroundColor = [UIColor whiteColor];
    
    //  封面
    _coverImage = [[UIImageView alloc] init];
    [self.leftView addSubview:_coverImage];
    [_coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.leftView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    _coverImage.backgroundColor = [UIColor lightGrayColor];
    
    _rightView = [[UIView alloc] init];
    [self.headerView addSubview:_rightView];
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView);
        make.right.equalTo(self.headerView);
        make.left.equalTo(niceView);
        make.bottom.equalTo(niceView);
    }];
    _rightView.backgroundColor = [UIColor whiteColor];
    //  时间
    _returnTime = [[UILabel alloc] init];
    [self.rightView addSubview:_returnTime];
    
    [_returnTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.coverImage);
        make.centerX.equalTo(self.rightView);
    }];
    _returnTime.text = @"2017/02/27前还款";
    _returnTime.textColor = [UIColor lightGrayColor];
    _returnTime.font = [UIFont systemFontOfSize:11.0 weight:UIFontWeightLight];
    
    //  钱
    _returnMoney = [[UILabel alloc] init];
    [self.rightView addSubview:_returnMoney];
    
    [_returnMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.returnTime);
        make.bottom.equalTo(self.returnTime.mas_top).offset(-3);
    }];
    _returnMoney.text = @"￥900";
    _returnMoney.textColor = JYColorFromRGB(81, 180, 245);
    _returnMoney.font  =[UIFont systemFontOfSize:23.0f weight:UIFontWeightBold];
}

#pragma mark - 定制Navgation
- (void)setupNavigation {
    self.navigationItem.title = @"账单";
}

#pragma mark - tableview代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JYRMoneyTableViewCell * rMoney = [tableView dequeueReusableCellWithIdentifier:@"rMoney" forIndexPath:indexPath];
    
    rMoney.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    rMoney.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return rMoney;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel * lable = [[UILabel alloc] init];

    lable.textColor = [UIColor lightGrayColor];
    lable.font = [UIFont systemFontOfSize:11.0f weight:UIFontWeightLight];
    lable.text = @"历史账单,共3笔";
    lable.textAlignment = NSTextAlignmentCenter;
    return lable;
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
