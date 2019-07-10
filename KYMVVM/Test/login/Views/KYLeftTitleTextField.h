//
//  KYLeftTitleTextField.h
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYLeftTitleTextField : UITextField
@property (copy, nonatomic) NSString *leftTitle;
- (CGSize)calculateSize:(NSString *)text font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
