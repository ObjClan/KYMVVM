//
//  CollectionViewModel.m
//  KYMVVM
//
//  Created by Key on 10/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "CollectionViewModel.h"

static NSString *const firstSectionId = @"firstSectionId";
static NSString *const secondSectionId = @"secondSectionId";
static NSString *const thirdSectionId = @"thirdSectionId";
static NSString *const cellClass1 = @"CollectionViewCell";
static NSString *const cellClass2 = @"CollectionView1Cell";
static NSString *const cellClass3 = @"CollectionView2Cell";
static NSUInteger const totalSecondCount = 45;
@implementation CollectionViewModel

- (void)initData
{
    self.currentPage = 0;
    self.pageCount = 20;
    [self registerCellClass:@[cellClass1,cellClass2,cellClass3]];
}
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh
{
    [super fetchDataWithIsRefresh:isRefresh];
    if (isRefresh) {
        self.currentPage = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshDataComplete];
        });
    } else {
        self.currentPage++;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadMoreDataComplete];
        });
    }
}
- (void)refreshDataComplete
{
    //第一个section
    KYBaseCellSectionModel *firstSection = [[KYBaseCellSectionModel alloc] init];
    firstSection.sectionId = firstSectionId;
    firstSection.headerHeight = 0;
    firstSection.footerHeight = 0;
    firstSection.minimumLineSpacing = 10;
    firstSection.minimumInteritemSpacing = 0;
    firstSection.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    //创建第1组的cell数据
    NSMutableArray *firstItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        CollectionCellItemModel *item = [[CollectionCellItemModel alloc] init];
        item.itemId = @"";
        item.height = 150;
        item.width = 110;
        item.className = cellClass1;
        item.title = [NSString stringWithFormat:@"firstItem_%d",i];
        [firstItems addObject:item];
    }
    firstSection.itemsModels = firstItems.copy;

    //第二个section
    KYBaseCellSectionModel *secondSection = [[KYBaseCellSectionModel alloc] init];
    secondSection.sectionId = secondSectionId;
    secondSection.headerHeight = 40;
    secondSection.footerHeight = 0;
    secondSection.minimumLineSpacing = 10;
    secondSection.minimumInteritemSpacing = 0;
    secondSection.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    //创建第1组的cell数据
    NSMutableArray *secondItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        CollectionCellItemModel1 *item = [[CollectionCellItemModel1 alloc] init];
        item.itemId = @"";
        item.height = 100;
        item.width = CGRectGetWidth([UIScreen mainScreen].bounds) - secondSection.edgeInsets.left - secondSection.edgeInsets.right;
        item.className = cellClass2;
        item.bottonHide = i == 2 ? YES : NO;
        [secondItems addObject:item];
    }
    secondSection.itemsModels = secondItems.copy;

    //第三个section
    KYBaseCellSectionModel *thirdSection = [[KYBaseCellSectionModel alloc] init];
    thirdSection.sectionId = thirdSectionId;
    thirdSection.footerHeight = 20;
    thirdSection.minimumLineSpacing = 0;
    thirdSection.minimumInteritemSpacing = 0;
    thirdSection.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    //创建1组的cell数据
    NSMutableArray *thirdItems = [[NSMutableArray alloc] init];
    KYBaseCellItemModel *item = [[KYBaseCellItemModel alloc] init];
    item.itemId = @"";
    item.height = 100;
    item.width = CGRectGetWidth([UIScreen mainScreen].bounds) - thirdSection.edgeInsets.left - thirdSection.edgeInsets.right;
    item.className = cellClass3;
    [thirdItems addObject:item];
    thirdSection.itemsModels = thirdItems.copy;

    self.sections = @[thirdSection,firstSection,secondSection];
    
    [self fetchDataCompleteWithIsRefresh:YES errorInfo:nil dataArray:self.sections];
}
- (void)loadMoreDataComplete
{
    //更新section
    KYBaseCellSectionModel *secondSectionModel = (KYBaseCellSectionModel *)[self getSectionModelWithId:secondSectionId];
    
    NSMutableArray *secondAllItems = (secondSectionModel.itemsModels).mutableCopy;
    NSUInteger count = self.pageCount;
    if (totalSecondCount - self.currentPage * self.pageCount < self.pageCount) {
        count = totalSecondCount - self.currentPage * self.pageCount;
    }
    NSMutableArray *currentItems = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < count; i++) {
        CollectionCellItemModel1 *item = [[CollectionCellItemModel1 alloc] init];
        item.itemId = @"";
        item.height = 120;
        item.width = CGRectGetWidth([UIScreen mainScreen].bounds) - secondSectionModel.edgeInsets.left - secondSectionModel.edgeInsets.right;
        item.className = cellClass2;
        [currentItems addObject:item];
    }
    [secondAllItems addObjectsFromArray:currentItems];
    secondSectionModel.itemsModels = secondAllItems.copy;
    
    [self fetchDataCompleteWithIsRefresh:NO errorInfo:nil dataArray:currentItems];
}
@end
