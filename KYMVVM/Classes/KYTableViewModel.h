//
//  KYTableVIewModel.h
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYBaseViewModel.h"
#import "KYBaseCellSectionModel.h"
NS_ASSUME_NONNULL_BEGIN


/**
 加载数据状态

 - KYLoadDataStatusPullDownLoading: 下拉刷新中
 - KYLoadDataStatusPullDownSuccess: 下拉刷新成功
 - KYLoadDataStatusPullDownEmpty: 下拉刷新数据为空
 - KYLoadDataStatusPullDownFaild: 下拉刷新失败
 - KYLoadDataStatusPullUpLoading: 上拉加载中
 - KYLoadDataStatusPullUpSuccess: 上拉加载成功
 - KYLoadDataStatusPullUpFaild: 上拉加载失败
 - KYLoadDataStatusNomore: 上拉没有更多
 */
typedef NS_ENUM(NSInteger, KYLoadDataStatus) {
    KYLoadDataStatusUnkown = 0,
    KYLoadDataStatusPullDownLoading,
    KYLoadDataStatusPullDownEmpty,
    KYLoadDataStatusPullDownSuccess,
    KYLoadDataStatusPullDownFaild,
    KYLoadDataStatusPullUpLoading,
    KYLoadDataStatusPullUpSuccess,
    KYLoadDataStatusPullUpFaild,
    KYLoadDataStatusNomore,
};

@interface KYTableViewModel : KYBaseViewModel

/**
 所有section模型
 */
@property (nonatomic, strong) NSArray<KYBaseCellSectionModel *> *sections;

/**
 所有cell类名列表
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *cellClassNames;
/**
 是否立即刷新tableView，请求数据结束后可设为YES
 */
@property (nonatomic, assign) BOOL shouldReloadData;
/**
 刷新某些cell
 */
@property (nonatomic, strong) NSArray<NSIndexPath *> *reloadIndexPaths;
/**
 分页时，当前页
 */
@property (nonatomic, assign) NSUInteger currentPage;
/**
 分页时，每页条数
 */
@property (nonatomic, assign) NSUInteger pageCount;

/**
 加载数据失败信息
 */
@property (nonatomic, copy) NSString *errorInfo;

/**
 加载数据状态
 */
@property (nonatomic, assign) KYLoadDataStatus loadDataStatus;


/**
 获取某个section模型

 @param sectionId sectionId
 */
- (KYBaseCellSectionModel *)getSectionModelWithId:(NSString *)sectionId;

/**
 获取某个Item模型

 @param sectionId sectionId
 @param itemId itemId
 */
- (KYBaseCellItemModel *)getItemModelWithSectionId:(NSString *)sectionId itemId:(NSString *)itemId;

/**
 获取某个indexPath

 @param sectionId sectionId
 @param itemId itemId
 */
- (NSIndexPath *)getIndexPathWithSectionId:(NSString *)sectionId itemId:(NSString *)itemId;

/**
 根据cell的类名注册cell

 @param classNames classNames
 */
- (void)registerCellClass:(NSArray<NSString *> *)classNames;

@end

NS_ASSUME_NONNULL_END
