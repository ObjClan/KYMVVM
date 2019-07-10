//
//  KYLoginVerifyCell.h
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseCollectionCell.h"
#import "KYPhoneVerifyTextField.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYLoginVerifyCell : KYBaseCollectionCell
@property (weak, nonatomic) IBOutlet KYPhoneVerifyTextField *textField;

@end

NS_ASSUME_NONNULL_END
