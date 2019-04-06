//
//  KYTableViewController.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYTableViewController.h"
#import "KYBaseTableCell.h"
@interface KYTableViewController ()

@end

@implementation KYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///处理tablview顶部有20的空白
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
- (void)addSubViews
{
    [self.view addSubview:self.tableView];
}
- (void)setSubViewConstraints
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.sections[section].itemsModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KYBaseCellItemModel *model = self.viewModel.sections[indexPath.section].itemsModels[indexPath.row];
    if (!model.className) {
        NSString *errInfo = @"cell的类名不能为空，请在viewModel中配置";
        @throw [NSException exceptionWithName:@"温馨提示" reason:errInfo userInfo:nil];
    }
    Class cellClass = NSClassFromString(model.className);
    KYBaseTableCell *cell = [cellClass createWithTableView:tableView];
    [self updateUIWithCell:cell model:model indexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.viewModel.sections[indexPath.section].itemsModels[indexPath.row].height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = self.viewModel.sections[section].headerHeight;
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat height = self.viewModel.sections[section].footerHeight;
    return height;
}
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    
}
@end
