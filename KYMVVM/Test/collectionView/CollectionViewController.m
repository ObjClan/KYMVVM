//
//  CollectionViewController.m
//  KYMVVM
//
//  Created by Key on 10/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewModel.h"
#import "CollectionViewCell.h"
#import "CollectionView1Cell.h"
#import "CollectionView2Cell.h"
#import "GameViewController.h"
@interface CollectionViewController ()
@property (nonatomic, strong) GameViewController *gameVC;
@end

@implementation CollectionViewController
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameVC = [[GameViewController alloc] init];
    [self addChildViewController:self.gameVC];
}
- (KYTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[CollectionViewModel alloc] init];
    }
    return _viewModel;
}
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    if ([model.className isEqualToString:NSStringFromClass([CollectionViewCell class])]) {
        CollectionViewCell *rCell = ((CollectionViewCell *)cell);
        CollectionCellItemModel *rModel = ((CollectionCellItemModel *)model);
        rCell.titleLB.text = rModel.title;
    } else
    if ([model.className isEqualToString:NSStringFromClass([CollectionView1Cell class])]) {
        CollectionView1Cell *rCell = ((CollectionView1Cell *)cell);
        CollectionCellItemModel1 *rModel = ((CollectionCellItemModel1 *)model);
        rCell.button.hidden = rModel.bottonHide;
    } else
    if ([model.className isEqualToString:NSStringFromClass([CollectionView2Cell class])]) {
        CollectionView2Cell *rCell = ((CollectionView2Cell *)cell);
        KYBaseCellItemModel *rModel = ((KYBaseCellItemModel *)model);
        if (![rCell.contentView.subviews containsObject:self.gameVC.view]) {
            [rCell.contentView addSubview:self.gameVC.view];
            [self.gameVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.bottom.equalTo(rCell.contentView);
                make.left.and.right.equalTo(rCell.contentView);
            }];
        }
    }
}
@end
