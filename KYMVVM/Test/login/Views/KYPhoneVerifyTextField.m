//
//  KYPhoneVerifyTextField.m
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYPhoneVerifyTextField.h"

@implementation KYPhoneVerifyTextField

- (void)setSendStatus:(KYSendCodeStatus)sendStatus
{
    _sendStatus = sendStatus;
    UIButton *btn = (UIButton *)self.rightView;
    if (!btn) {
        btn = [[UIButton alloc] init];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn addTarget:self action:@selector(sendBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.rightView = btn;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
    
    NSString *title = nil;
    switch (sendStatus) {
        case KYSendCodeStatusWait:
            title = @"发送验证码";
            btn.enabled = YES;
            break;
        case KYSendCodeStatusSending:
            title = @"发送中...";
            btn.enabled = NO;
            break;
        case KYSendCodeStatusSent:
            title = @"(60)秒后重试";
            btn.enabled = NO;
            [self countDown:btn];
            break;
        case KYSendCodeStatusResend:
            title = @"重新发送";
            btn.enabled = YES;
            break;
    }
    
    [btn setTitle:title forState:UIControlStateNormal];
    CGSize size = [self calculateSize:title font:btn.titleLabel.font];
    CGRect frame = CGRectMake(0, 0, size.width + 40, CGRectGetHeight(self.frame));
    btn.bounds = frame;
}
- (void)sendBtnClicked:(UIButton *)button
{
    if (self.actionDelegate && [self.actionDelegate respondsToSelector:@selector(phoneVerifySendCodeAction:)]) {
        [self.actionDelegate phoneVerifySendCodeAction:button];
    }
}
- (void)countDown:(UIButton *)button
{
    static int count = 60;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (count > 1) {
            count--;
            NSString *title = [NSString stringWithFormat:@"(%d)秒后重试",count];
            [button setTitle:title forState:UIControlStateNormal];
            [self countDown:button];
        } else {
            count = 60;
            self.sendStatus = KYSendCodeStatusResend;
        }
    });
}
@end
