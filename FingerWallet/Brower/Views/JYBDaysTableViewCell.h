//
//  JYBDaysTableViewCell.h
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finshEnterDays)(NSString * days);

@interface JYBDaysTableViewCell : UITableViewCell

@property (nonatomic, copy) finshEnterDays finshEnter;

@end
