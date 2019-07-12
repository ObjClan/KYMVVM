//
//  KYTemplateCollectionViewController.m
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTemplateCollectionViewController.h"
#import "KYTemplateCollectionViewModel.h"
#import "KYTemplateCollectionCell.h"
#import "KYTemplateCollectionItemModel.h"
@implementation KYTemplateCollectionViewController
@synthesize viewModel = _viewModel;
- (BOOL)shouldPullDownRefresh
{
    return YES;
}
- (BOOL)shouldPullUpLoadMore
{
    return YES;
}
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}
- (KYTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[KYTemplateCollectionViewModel alloc] init];
    }
    return _viewModel;
}
- (void)updateUIWithCell:(UITableViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYTemplateCollectionCell *rCell = (KYTemplateCollectionCell *)cell;
    KYTemplateCollectionItemModel *rModel =(KYTemplateCollectionItemModel *)model;
}
@end
