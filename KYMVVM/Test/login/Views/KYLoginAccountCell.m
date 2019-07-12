//
//  KYLoginAccountCell.m
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYLoginAccountCell.h"

@implementation KYLoginAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.secureTextEntry = NO;
}
@end
