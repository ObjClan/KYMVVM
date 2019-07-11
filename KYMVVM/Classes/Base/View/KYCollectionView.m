//
//  KYCollectionView.m
//  KYMVVM
//
//  Created by Key on 10/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYCollectionView.h"
#import "UIView+KYMVVM.h"

@implementation KYCollectionView


#pragma mark --------------处理controller不影响touches事件------------------

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UIViewController *vc = [self getController];
    if (vc) {
        [vc touchesBegan:touches withEvent:event];
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UIViewController *vc = [self getController];
    if (vc) {
        [vc touchesEnded:touches withEvent:event];
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UIViewController *vc = [self getController];
    if (vc) {
        [vc touchesMoved:touches withEvent:event];
    }
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    UIViewController *vc = [self getController];
    if (vc) {
        [vc touchesCancelled:touches withEvent:event];
    }
}
@end
