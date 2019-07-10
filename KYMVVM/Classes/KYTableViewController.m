//
//  KYTableViewController.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYTableViewController.h"
#import <objc/message.h>
@interface KYTableViewController ()

@end

@implementation KYTableViewController

- (void)addBind
{
    @weakify(self)
    [RACObserve(self.viewModel, shouldReloadData) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.tableView reloadData];
    }];
    [RACObserve(self.viewModel, reloadIndexPaths) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.tableView reloadRowsAtIndexPaths:self.viewModel.reloadIndexPaths withRowAnimation:UITableViewRowAnimationNone];
    }];
    [RACObserve(self.viewModel, loadDataStatus) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        KYLoadDataStatus status = [x integerValue];
        switch (status) {
            case KYLoadDataStatusPullDownLoading:
                [self.tableView.mj_footer resetNoMoreData];
                break;
            case KYLoadDataStatusPullDownSuccess:
                [self.tableView.mj_header endRefreshing];
                break;
            case KYLoadDataStatusPullDownEmpty:
                [self.tableView.mj_header endRefreshing];
                break;
            case KYLoadDataStatusPullDownFaild:
                [self.tableView.mj_header endRefreshing];
                break;
            case KYLoadDataStatusPullUpLoading:
                break;
            case KYLoadDataStatusPullUpSuccess:
                [self.tableView.mj_footer endRefreshing];
                break;
            case KYLoadDataStatusPullUpFaild:
                [self.tableView.mj_footer endRefreshing];
                break;
            case KYLoadDataStatusNomore:
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                break;
            default:
                break;
        }
        [self.tableView reloadData];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ///处理tablview顶部有20的空白
    ///处理tablview顶部有20的空白
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if ([self shouldPullDownRefresh]) {
        [self setMJHeader];
        [self.tableView.mj_header beginRefreshing];
    }
    if ([self shouldPullUpLoadMore]) {
        [self setMJFooter];
    }
    if (!self.viewModel) {
        NSString *errInfo = [NSString stringWithFormat:@"%@ viewModel不能为空，请重写viewModel的getter方法",NSStringFromClass([self class])] ;
        @throw [NSException exceptionWithName:@"温馨提示" reason:errInfo userInfo:nil];
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
- (KYTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[KYTableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (BOOL)shouldPullDownRefresh
{
    return NO;
}
- (BOOL)shouldPullUpLoadMore
{
    return NO;
}
- (void)setMJHeader
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self.viewModel fetchDataWithIsRefresh:YES];
    }];
}
- (void)setMJFooter
{
    @weakify(self)
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self.viewModel fetchDataWithIsRefresh:NO];
    }];
    MJRefreshAutoNormalFooter *footer = (MJRefreshAutoNormalFooter *)self.tableView.mj_footer;
    footer.onlyRefreshPerDrag = YES;
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
        NSString *errInfo = [NSString stringWithFormat:@"%@ cell的类名不能为空，请在viewModel中配置",NSStringFromClass([self class])] ;
        @throw [NSException exceptionWithName:@"温馨提示" reason:errInfo userInfo:nil];
    }
    Class cellClass = NSClassFromString(model.className);
    KYBaseTableCell *cell = [cellClass createWithTableView:tableView indexPath:indexPath delegate:self itemId:model.itemId];
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@UpdateUIWithCell:model:indexPath:",model.itemId]);
    if ([self respondsToSelector:sel]) {
        void (*action)(id, SEL, KYBaseTableCell *, KYBaseCellItemModel *,NSIndexPath *) =
        (void (*)(id, SEL, KYBaseTableCell *, KYBaseCellItemModel *,NSIndexPath *)) objc_msgSend;
        action(self,sel,cell,model,indexPath);
    }
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KYBaseTableCell *cell = (KYBaseTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell.denySelect) {
        return;
    }
    [cell actionWithSender:nil object:nil];
}
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    
}
@end
