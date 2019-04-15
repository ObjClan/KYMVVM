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
@implementation CollectionViewModel
- (void)initData
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
        item.className = @"CollectionViewCell";
        [self registerCellName:item.className];
        item.title = [NSString stringWithFormat:@"firstItem_%d",i];
        [firstItems addObject:item];
    }
    firstSection.itemsModels = firstItems.copy;
    
    //第二个section
    KYBaseCellSectionModel *secondSection = [[KYBaseCellSectionModel alloc] init];
    secondSection.sectionId = firstSectionId;
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
        item.className = @"CollectionView1Cell";
        [self registerCellName:item.className];
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
    item.className = @"CollectionView2Cell";
    [self registerCellName:item.className];
    [thirdItems addObject:item];
    thirdSection.itemsModels = thirdItems.copy;
    
    self.sections = @[thirdSection,firstSection,secondSection];
    
}

@end
