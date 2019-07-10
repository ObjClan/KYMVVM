//
//  KYLeftTitleTextField.m
//  KYMVVM
//
//  Created by Key on 09/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYLeftTitleTextField.h"

@implementation KYLeftTitleTextField


- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    UILabel *leftLabel = (UILabel *)self.leftView;
    if (!leftLabel) {
        leftLabel = [[UILabel alloc] init];
        leftLabel.font = [UIFont systemFontOfSize:17];
        leftLabel.textAlignment = NSTextAlignmentCenter;
        self.leftView = leftLabel;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    leftLabel.text = leftTitle;
    CGSize size = [self calculateSize:leftTitle font:leftLabel.font];
    CGRect frame = CGRectMake(0, 0, size.width + 40, size.height);
    leftLabel.bounds = frame;
}
- (CGSize)calculateSize:(NSString *)text font:(UIFont *)font
{
    if (!font) {
        return CGSizeZero;
    }
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size;
}
@end
