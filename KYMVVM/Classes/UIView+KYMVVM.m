//
//  UIView+KYMVVM.m
//  KYMVVM
//
//  Created by Key on 10/07/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "UIView+KYMVVM.h"

@implementation UIView (KYMVVM)
- (UIViewController *)getController
{
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end
