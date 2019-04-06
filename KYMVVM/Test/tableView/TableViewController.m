//
//  TableViewController.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewModel.h"
#import "TableViewCell.h"
#import "TableView1Cell.h"
@interface TableViewController ()

@end

@implementation TableViewController
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewModel fetchDataWithCompletion:^{
        [self.tableView reloadData];
    }];
}
- (KYTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[TableViewModel alloc] init];
    }
    return _viewModel;
}
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(nonnull NSIndexPath *)indexPath
{
    if ([model.className isEqualToString:NSStringFromClass([TableViewCell class])]) {
        TableViewCell *rCell = ((TableViewCell *)cell);
        TableCellItemModel *rModel = ((TableCellItemModel *)model);
        rCell.nameLab.text = rModel.name;
    } else
    if ([model.className isEqualToString:NSStringFromClass([TableView1Cell class])]) {
        TableView1Cell *rCell = ((TableView1Cell *)cell);
        TableCellItemModel1 *rModel = ((TableCellItemModel1 *)model);
        rCell.titleLab.text = rModel.title;
    }
}
@end
