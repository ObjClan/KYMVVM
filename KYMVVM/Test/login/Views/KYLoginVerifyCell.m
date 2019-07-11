//
//  KYLoginVerifyCell.m
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYLoginVerifyCell.h"

@interface KYLoginVerifyCell ()<KYPhoneVerifyTextFieldDelegate>

@end
@implementation KYLoginVerifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textField.sendStatus = KYSendCodeStatusWait;
    self.textField.actionDelegate = self;
}
- (void)phoneVerifySendCodeAction:(UIButton *)sender
{
    [self actionWithSender:sender object:nil];
}
@end
