//
//  JYBrowerViewController.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYBrowerViewController.h"

#import "JYBMoneyTableViewCell.h"
#import "JYBDaysTableViewCell.h"

@interface JYBrowerViewController () <UITableViewDelegate, UITableViewDataSource>

//  消息按钮
@property (nonatomic, strong) UIBarButtonItem * msgBarItem;

//  tabview
@property (nonatomic, strong) UITableView * tableView;

//  头视图
@property (nonatomic, strong) UIView * headerView;
//  封面图片
@property (nonatomic, strong) UIImageView * coverImage;
//  借款钱数
@property (nonatomic, strong) UILabel * totalMoney;
//  到期还款
@property (nonatomic, strong) UILabel * untillMoney;
//  借款天数
@property (nonatomic, strong) UILabel * totalDay;

//  退出登录按钮
@property (nonatomic, strong) UIButton * commitBtn;

@property (nonatomic, strong) UIView * footerView;

@end

@implementation JYBrowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigation];
    
    [self setupMainUI];
}

#pragma mark - 创建主界面
- (void)setupMainUI {
    
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
    
    [_tableView registerNib:[UINib nibWithNibName:@"JYBMoneyTableViewCell" bundle:nil] forCellReuseIdentifier:@"bMoney"];
    [_tableView registerNib:[UINib nibWithNibName:@"JYBDaysTableViewCell" bundle:nil] forCellReuseIdentifier:@"bDays"];
    
    
    _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWight, 50)];
    
    _commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commitBtn setBackgroundImage:[UIImage imageNamed:@"bg"] forState:UIControlStateNormal];
    _commitBtn.frame = CGRectMake(40, 0, ScreenWight - 80, 50);
    [_commitBtn setTitle:@"申请借款" forState:UIControlStateNormal];
    [_commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _commitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _commitBtn.clipsToBounds = YES;
    _commitBtn.layer.cornerRadius = 5;
    _commitBtn.backgroundColor = JYMainColor;
    [_commitBtn addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_footerView addSubview:_commitBtn];
    
    
    _tableView.tableFooterView = _footerView;
    
    //  头图
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWight, 240)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = _headerView;
    
    //  封面
    _coverImage = [[UIImageView alloc] init];
    [_headerView addSubview:_coverImage];
    
    [_coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView);
        make.top.equalTo(self.headerView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    _coverImage.backgroundColor = [UIColor lightGrayColor];
    
    //  总借款钱数
    _totalMoney = [[UILabel alloc] init];
    [_headerView addSubview:_totalMoney];
    
    [_totalMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView);
        make.top.equalTo(self.coverImage.mas_bottom).offset(15);
    }];
    
    _totalMoney.text = @"￥0";
    _totalMoney.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    _totalMoney.textColor = [UIColor redColor];
    
    //  借款金额提示
    UILabel * totalMoneyTips = [[UILabel alloc] init];
    totalMoneyTips.text = @"借款金额";
    [self.headerView addSubview:totalMoneyTips];
    [totalMoneyTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView);
        make.top.equalTo(self.totalMoney.mas_bottom).offset(3);
    }];
    totalMoneyTips.font = [UIFont systemFontOfSize:11.0 weight:UIFontWeightLight];
    totalMoneyTips.textColor = [UIColor lightGrayColor];
    
    //  竖线
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    [self.headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView);
        make.bottom.equalTo(self.headerView).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(0.5);
    }];
    
    //  到期还款提示
    UILabel * untillTips = [[UILabel alloc] init];
    untillTips.text = @"到期还款";
    [self.headerView addSubview:untillTips];
    
    [untillTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lineView.mas_bottom);
        make.left.equalTo(self.headerView);
        make.right.equalTo(lineView);
    }];
    untillTips.textAlignment = NSTextAlignmentCenter;
    untillTips.textColor = [UIColor lightGrayColor];
    untillTips.font = [UIFont systemFontOfSize:11.0 weight:UIFontWeightLight];
    
    _untillMoney = [[UILabel alloc] init];
    [self.headerView addSubview:_untillMoney];
    [_untillMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(untillTips);
        make.bottom.equalTo(untillTips.mas_top).offset(-3);
    }];
    _untillMoney.textColor = [UIColor blackColor];
    _untillMoney.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightBold];
    _untillMoney.text = @"￥0";
    
    
    
    //  借款期限
    UILabel * daysTips = [[UILabel alloc] init];
    daysTips.text = @"借款期限";
    [self.headerView addSubview:daysTips];
    
    [daysTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lineView.mas_bottom);
        make.right.equalTo(self.headerView);
        make.left.equalTo(lineView);
    }];
    daysTips.textAlignment = NSTextAlignmentCenter;
    daysTips.textColor = [UIColor lightGrayColor];
    daysTips.font = [UIFont systemFontOfSize:11.0 weight:UIFontWeightLight];
    
    _totalDay = [[UILabel alloc] init];
    [self.headerView addSubview:_totalDay];
    [_totalDay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(daysTips);
        make.bottom.equalTo(daysTips.mas_top).offset(-3);
    }];
    _totalDay.textColor = [UIColor blackColor];
    _totalDay.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightBold];
    _totalDay.text = @"0天";
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JYBMoneyTableViewCell * MoneyCell = [tableView dequeueReusableCellWithIdentifier:@"bMoney" forIndexPath:indexPath];
        
        MoneyCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        MoneyCell.finishEnter = ^(NSString * money) {
            self.totalMoney.text = [NSString stringWithFormat:@"￥%@",money];
            self.untillMoney.text = [NSString stringWithFormat:@"￥%.2f",money.floatValue + 0];
        };

        return MoneyCell;
    }
    
    JYBDaysTableViewCell * Dayscell = [tableView dequeueReusableCellWithIdentifier:@"bDays" forIndexPath:indexPath];

    Dayscell.selectionStyle = UITableViewCellSelectionStyleNone;

    Dayscell.finshEnter = ^(NSString * days) {
        self.totalDay.text = [NSString stringWithFormat:@"%@天",days];
        self.untillMoney.text = [NSString stringWithFormat:@"￥%.2f",self.totalMoney.text.floatValue + 1.5 * days.floatValue];
    };
    
    return Dayscell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

#pragma mark - 申请借款按钮点击
- (void)commitClick {
    
}

#pragma mark - 定制Navgation 
- (void)setupNavigation {
    self.navigationItem.title = @"指尖钱包";
    
    _msgBarItem = [[UIBarButtonItem alloc] initWithTitle:@"消息" style:UIBarButtonItemStyleDone target:self action:@selector(msgClick)];
    self.navigationItem.leftBarButtonItem = _msgBarItem;

    
}

#pragma mark - 消息点击
- (void)msgClick {
    
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
