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
NS_ASSUME_NONNULL_BEGIN

@interface KYTableViewController : KYBaseViewController<UITableViewDelegate, UITableViewDataSource,KYTableViewCellProtocol>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KYTableViewModel *viewModel;
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
