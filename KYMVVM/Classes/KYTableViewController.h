//
//  KYTableViewController.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseViewController.h"
#import "KYTableViewModel.h"
#import "KYBaseTableCell.h"
#import <MJRefresh/MJRefresh.h>
#import "KYTableView.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYTableViewController : KYBaseViewController<UITableViewDelegate, UITableViewDataSource,KYTableViewCellProtocol>
@property (nonatomic, strong) KYTableView *tableView;
@property (nonatomic, strong) KYTableViewModel *viewModel;

/**
 是否开启下拉刷新
 */
- (BOOL)shouldPullDownRefresh;

/**
 是否开启上拉加载更多
 */
- (BOOL)shouldPullUpLoadMore;

/**
 更新Cell的UI

 @param cell cell
 @param model 数据模型
 @param indexPath indexPath
 */
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
