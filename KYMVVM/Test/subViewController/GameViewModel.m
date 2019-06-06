//
//  GameViewModel.m
//  KYMVVM
//
//  Created by Key on 11/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "GameViewModel.h"
static NSString *const firstSectionId = @"firstSectionId";
@implementation GameViewModel
- (void)initData
{
    [self registerCellClass:@[@"GameCell"]];
    //第一个section
    KYBaseCellSectionModel *firstSection = [[KYBaseCellSectionModel alloc] init];
    firstSection.sectionId = firstSectionId;
    firstSection.headerHeight = 0;
    firstSection.footerHeight = 0;
    firstSection.minimumLineSpacing = 10;
    firstSection.minimumInteritemSpacing = 0;
    firstSection.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    //创建第1组的cell数据
    NSMutableArray *firstItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        GameItemModel *item = [[GameItemModel alloc] init];
        item.itemId = @"";
        item.height = 80;
        item.width = 150;
        item.className = @"GameCell";
        item.name = [NSString stringWithFormat:@"Item_%d",i];
        [firstItems addObject:item];
    }
    firstSection.itemsModels = firstItems.copy;
    self.sections = @[firstSection];
}
@end
