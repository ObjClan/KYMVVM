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
    [super addBind];
    
    TableViewModel *viewModel = (TableViewModel *)self.viewModel;
    RAC(self,titleLB.text) = RACObserve(viewModel, title);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TableViewModel *viewModel = (TableViewModel *)self.viewModel;
    [viewModel fetchTitle];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [viewModel updateOneCellContent];
    });
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
- (BOOL)shouldPullDownRefresh
{
    return YES;
}
- (BOOL)shouldPullUpLoadMore
{
    return YES;
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
        rCell.switchBtn.on = rModel.isSwitchON;
    }
}
- (void)cellAction:(id)cell sender:(UIView *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    if ([cell isKindOfClass:[TableViewCell class]]) {
        NSLog(@"cell clicked Btn1 %@",indexPath);
    } else
    if ([cell isKindOfClass:[TableView1Cell class]]) {
        int type = [object intValue];
        switch (type) {
            case 1:
                NSLog(@"cell1 clicked Btn1 %@",indexPath);
                break;
            case 2:
                NSLog(@"cell1 clicked Btn2 %@",indexPath);
                break;
            case 3: {
                KYBaseCellItemModel *model = self.viewModel.sections[indexPath.section].itemsModels[indexPath.row];
                TableCellItemModel1 *rModel = ((TableCellItemModel1 *)model);
                UISwitch *switchBtn = (UISwitch *)sender;
                rModel.isSwitchON = switchBtn.on;
                NSLog(@"cell1 %d---%@",switchBtn.on,indexPath);
                break;
            }
            default:
                break;
        }
    }
}

@end
