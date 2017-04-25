//
//  JYBMoneyTableViewCell.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYBMoneyTableViewCell.h"
#import "UIViewController+DismissKeyboard.h"

@interface JYBMoneyTableViewCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *bMoney;


@end

@implementation JYBMoneyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _bMoney.delegate = self;
    _bMoney.returnKeyType = UIReturnKeyDone;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    self.finishEnter( [NSString stringWithFormat:@"%.2f",textField.text.floatValue]);
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    self.finishEnter( [NSString stringWithFormat:@"%.2f",[textField.text stringByReplacingCharactersInRange:range withString:string].floatValue]);
    
    return YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
