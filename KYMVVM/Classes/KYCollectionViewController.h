//
//  KYCollectionViewController.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseViewController.h"
#import "KYTableViewModel.h"
#import "KYBaseCollectionCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYCollectionViewController : KYBaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,KYTableViewCellProtocol>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) KYTableViewModel *viewModel;

/**
 数据更新后，更新UI,，由子类重写

 @param cell 当前cell
 @param model 当前数据模型
 @param indexPath indexPath
 */
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath;

/**
 collectionViewFlowLayout 默认为系统UICollectionViewFlowLayout
 如果自定义，需子类重写
 */
- (UICollectionViewFlowLayout *)collectionViewFlowLayout;
@end

NS_ASSUME_NONNULL_END
