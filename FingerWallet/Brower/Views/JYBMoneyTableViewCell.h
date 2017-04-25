//
//  JYBMoneyTableViewCell.h
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^finishEnterMoney) (NSString * money);

@interface JYBMoneyTableViewCell : UITableViewCell

@property (nonatomic, copy) finishEnterMoney finishEnter;

@end
