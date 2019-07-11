//
//  KYBaseCollectionCell.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseCollectionCell.h"
#import <objc/message.h>
@implementation KYBaseCollectionCell

- (void)actionWithSender:(nullable id)sender object:(nullable id)object
{
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@CellAction:sender:indexPath:object:",self.itemId]);
    if ([self.delegate respondsToSelector:sel]) {
        void (*action)(id, SEL, KYBaseCollectionCell *, UIButton *,NSIndexPath *,id) =
        (void (*)(id, SEL, KYBaseCollectionCell *, UIButton *,NSIndexPath *,id)) objc_msgSend;
        action(self.delegate,sel,self,sender,self.indexPath,object);
    } else {
        if ([self.delegate respondsToSelector:@selector(cellAction:sender:indexPath:object:)]) {
            [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:object];
        }
    }
    
}
- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    //清除绑定
    if (self.compoundDisposable) {
        [self.compoundDisposable dispose];
        self.compoundDisposable = nil;
    }
}
- (void)mutualBindWithTerminal:(RACChannelTerminal *)terminal terminal1:(RACChannelTerminal *)terminal1
{
    RACDisposable *disposable = [terminal subscribe:terminal1];
    RACDisposable *disposable1 = [terminal1 subscribe:terminal];
    self.compoundDisposable = [RACCompoundDisposable compoundDisposableWithDisposables:@[disposable1, disposable]];
}
@end
