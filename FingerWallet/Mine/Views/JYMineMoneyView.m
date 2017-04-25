//
//  JYMineMoneyView.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYMineMoneyView.h"

@interface JYMineMoneyView ()

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;


@end

@implementation JYMineMoneyView


- (instancetype)init {
    if (self = [super init]) {
        [self setupSubViews];
    }
    return self;
}

#pragma mark - 初始化子空间
- (void)setupSubViews {
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

@end
