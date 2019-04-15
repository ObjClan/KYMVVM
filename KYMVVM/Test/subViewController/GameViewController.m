//
//  GameViewController.m
//  KYMVVM
//
//  Created by Key on 11/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "GameViewController.h"
#import "GameViewModel.h"
#import "GameCell.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor yellowColor];
}
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return layout;
}
- (KYTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[GameViewModel alloc] init];
    }
    return _viewModel;
}
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    if ([model.className isEqualToString:NSStringFromClass([GameCell class])]) {
        GameCell *rCell = ((GameCell *)cell);
        GameItemModel *rModel = ((GameItemModel *)model);
        rCell.nameLB.text = rModel.name;
    }
}
#pragma mark -----------cell的delegate-------------------
- (void)cellAction:(id)cell sender:(UIView *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    NSLog(@"%@",self.viewModel.sections[indexPath.section].itemsModels[indexPath.row]);
}
@end
