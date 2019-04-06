//
//  KYBaseViewController.h
//  KYMVVM
//
//  Created by object_lan on 2019/3/31.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>
@interface KYBaseViewController : UIViewController
- (void)addBind;
- (void)addSubViews;
- (void)setSubViewConstraints;
@end
