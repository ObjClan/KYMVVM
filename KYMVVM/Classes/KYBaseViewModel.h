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

 @param isRefresh 是否为刷新数据，当开启下拉刷新和上拉加载时，YES为下拉刷新，NO为上拉加载更多
 */
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh;

/**
 请求数据完成，由子类实现

 @param isRefresh 是否为刷新数据，当开启下拉刷新和上拉加载时，YES为下拉刷新，NO为上拉加载更多
 @param dataArray 本次请求回来的数据列表
 */
- (void)fetchDataCompleteWithIsRefresh:(BOOL)isRefresh errorInfo:(NSString *)errorInfo dataArray:(NSArray *)dataArray;
@end
