//
//  KYCollectionViewController.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYCollectionViewController.h"
@interface KYCollectionViewController ()

@end

@implementation KYCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor redColor];
    ///处理tablview顶部有20的空白
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self registerCellClass:self.viewModel.cellNames];
}
- (void)registerCellClass:(NSArray<NSString *> *)classes
{
    for (NSString *className in classes) {
        Class cellClass = NSClassFromString(className);
        if (!cellClass) {
            NSString *errInfo = [NSString stringWithFormat:@"%@中%@ cell的类名不存在，请在检查",NSStringFromClass([self class]),className] ;
            @throw [NSException exceptionWithName:@"温馨提示" reason:errInfo userInfo:nil];
        }
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:className ofType:@"nib"];
        if (!nibPath || ![[NSFileManager defaultManager] fileExistsAtPath:nibPath]) {
            [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:className];
        } else {
            UINib *nib = [UINib nibWithNibName:className bundle:nil];
            [self.collectionView registerNib:nib forCellWithReuseIdentifier:className];
        }
    }
}
- (void)addSubViews
{
    [self.view addSubview:self.collectionView];
}
- (void)setSubViewConstraints
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [self collectionViewFlowLayout];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return layout;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.viewModel.sections.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.sections[section].itemsModels.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KYBaseCellItemModel *model = self.viewModel.sections[indexPath.section].itemsModels[indexPath.row];
    if (!model.className) {
        NSString *errInfo = [NSString stringWithFormat:@"%@ cell的类名不能为空，请在viewModel中配置",NSStringFromClass([self class])] ;
        @throw [NSException exceptionWithName:@"温馨提示" reason:errInfo userInfo:nil];
    }
    KYBaseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.className forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.delegate = self;
    [self updateUIWithCell:cell model:model indexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = self.viewModel.sections[indexPath.section].itemsModels[indexPath.row].width;
    CGFloat height  = self.viewModel.sections[indexPath.section].itemsModels[indexPath.row].height;
    return CGSizeMake(width, height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if ([self collectionViewFlowLayout].scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        return CGSizeMake(0, 0);
    }
    CGFloat height = self.viewModel.sections[section].headerHeight;
    return CGSizeMake(CGRectGetWidth(collectionView.frame), height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if ([self collectionViewFlowLayout].scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        return CGSizeMake(0, 0);
    }
    CGFloat height = self.viewModel.sections[section].footerHeight;
    return CGSizeMake(CGRectGetWidth(collectionView.frame), height);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.viewModel.sections[section].minimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return self.viewModel.sections[section].minimumInteritemSpacing;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.viewModel.sections[section].edgeInsets;
}
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYBaseCellItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    
}
@end
