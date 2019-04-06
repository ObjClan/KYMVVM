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
@property (nonatomic, weak) IBOutlet UILabel *titleLB;
@end

@implementation TableViewController
@synthesize viewModel = _viewModel;

- (void)addBind
{
    TableViewModel *viewModel = (TableViewModel *)self.viewModel;
    @weakify(self)
    RAC(self,titleLB.text) = RACObserve(viewModel, title);
    [RACObserve(viewModel, shouldReload) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        if ([x boolValue]) [self.tableView reloadData];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TableViewModel *viewModel = (TableViewModel *)self.viewModel;
    [viewModel fetchTitle];
    [viewModel fetchDataWithCompletion:nil];
}
- (void)addSubViews
{
    [super addSubViews];
}
- (void)setSubViewConstraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLB.mas_bottom);
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
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
