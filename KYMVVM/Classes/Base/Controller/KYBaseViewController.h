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

/**
 RAC绑定，必需调super方法
 */
- (void)addBind;

/**
 初始化子视图
 */
- (void)addSubViews;

/**
 设置子视图的约束
 */
- (void)setSubViewConstraints;
@end
