//
//  JYBDaysTableViewCell.m
//  FingerWallet
//
//  Created by apple on 2017/4/25.
//  Copyright © 2017年 JiYi. All rights reserved.
//

#import "JYBDaysTableViewCell.h"

@interface JYBDaysTableViewCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *daysTextField;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@property (nonatomic, strong) NSString * day;

@end

@implementation JYBDaysTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _day = @"5";
    
    _daysTextField.delegate = self;
    _daysTextField.text = _day;
    
    _addBtn.clipsToBounds = YES;
    _subBtn.clipsToBounds = YES;
    _addBtn.layer.borderWidth = 0.5f;
    _addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _subBtn.layer.borderWidth = 0.5f;
    _subBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _daysTextField.layer.borderWidth = 0.5f;
    _daysTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (IBAction)addClick:(UIButton *)sender {
    _daysTextField.text = [NSString stringWithFormat:@"%.0f",_daysTextField.text.floatValue + 1];
    _day = _daysTextField.text;
    self.finshEnter( [NSString stringWithFormat:@"%.0f",self.daysTextField.text.floatValue]);
}
- (IBAction)subClick:(UIButton *)sender {
    //  先判断当前的天数
    if (_day.floatValue == 1) {
        //  等于1天的时候 不允许在减 抖动
        
        return;
    }
    _daysTextField.text = [NSString stringWithFormat:@"%.0f",_daysTextField.text.floatValue - 1];
    _day = _daysTextField.text;
    self.finshEnter( [NSString stringWithFormat:@"%.0f",self.daysTextField.text.floatValue]);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    self.finshEnter( [NSString stringWithFormat:@"%.0f",textField.text.floatValue]);
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    self.finshEnter( [NSString stringWithFormat:@"%.0f",[textField.text stringByReplacingCharactersInRange:range withString:string].floatValue]);
    
    return YES;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
