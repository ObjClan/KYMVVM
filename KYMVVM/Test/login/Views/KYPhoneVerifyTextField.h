//
//  KYPhoneVerifyTextField.h
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYLeftTitleTextField.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KYSendCodeStatus) {
    KYSendCodeStatusWait = 0,
    KYSendCodeStatusSending,
    KYSendCodeStatusSent,
    KYSendCodeStatusResend,
};

@protocol KYPhoneVerifyTextFieldDelegate <NSObject>
- (void)phoneVerifySendCodeAction:(UIButton *)sender;
@end
@interface KYPhoneVerifyTextField : KYLeftTitleTextField
@property (nonatomic, assign) KYSendCodeStatus sendStatus;
@property (nonatomic, weak) id<KYPhoneVerifyTextFieldDelegate> actionDelegate;
@end

NS_ASSUME_NONNULL_END
