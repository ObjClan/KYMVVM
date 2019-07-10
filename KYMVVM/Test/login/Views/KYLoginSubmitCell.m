//
//  KYLoginSubmitCell.m
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYLoginSubmitCell.h"

@implementation KYLoginSubmitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.loginLB.layer.cornerRadius = 5;
    self.loginLB.layer.masksToBounds = YES;
}
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (!self.denySelect) {
        self.loginLB.backgroundColor = highlighted ?  [UIColor grayColor] : [UIColor orangeColor];
        self.loginLB.textColor = highlighted ?  [UIColor whiteColor] : [UIColor blackColor];
    }
}
- (void)setDenySelect:(BOOL)denySelect
{
    [super setDenySelect:denySelect];
    self.loginLB.backgroundColor = denySelect ?  [UIColor grayColor] : [UIColor orangeColor];
    self.loginLB.textColor = denySelect ?  [UIColor whiteColor] : [UIColor blackColor];
}
@end
