//
//  KYBaseViewModel.h
//  KYMVVM
//
//  Created by object_lan on 2019/4/1.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYBaseViewModel : NSObject

/**
 数据初始化，由子类实现
 */
- (void)initData;

/**
 请求数据，由子类实现
 如果存在多个请求，则在子类中新加请求方法

 @param completion 数据处理完成回调
 */
- (void)fetchDataWithCompletion:(void(^)(void))completion;
@end
