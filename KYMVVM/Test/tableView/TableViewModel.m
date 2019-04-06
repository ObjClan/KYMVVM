//
//  TableViewModel.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//


#import "TableViewModel.h"

static NSString *const userSectionId = @"userSectionId";
static NSString *const gameSectionId = @"gameSectionId";
static NSString *const gameFirstItemId = @"gameFirstItemId";

@implementation TableViewModel

- (void)initData
{
    //第一个section
    TableCellSectionModel *userSection = [[TableCellSectionModel alloc] init];
    userSection.sectionId = userSectionId;
    userSection.headerHeight = 20;
    userSection.footerHeight = 10;
    //创建第1组的cell数据
    NSMutableArray *userItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        TableCellItemModel *item = [[TableCellItemModel alloc] init];
        item.itemId = @"";
        item.height = 80;
        item.className = @"TableViewCell";
        item.name = [NSString stringWithFormat:@"headerItem_%d",i];
        [userItems addObject:item];
    }
    userSection.itemsModels = userItems.copy;

    //第二个section
    TableCellSectionModel *gameSection = [[TableCellSectionModel alloc] init];
    gameSection.sectionId = gameSectionId;
    gameSection.footerHeight = 50;
    //创建第2组的cell数据
    NSMutableArray *gameItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++) {
        TableCellItemModel1 *item = [[TableCellItemModel1 alloc] init];
        item.itemId = i == 0 ? gameFirstItemId : @"";
        item.height = 50;
        item.className = @"TableView1Cell";
        item.title = [@(i) stringValue];
        [gameItems addObject:item];
    }
    gameSection.itemsModels = gameItems.copy;
    
    self.sections = @[userSection,gameSection];
    
}
- (void)fetchDataWithCompletion:(void (^)(void))completion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //更新section
        TableCellSectionModel *userSection = (TableCellSectionModel *)[self getSectionModelWithId:userSectionId];
        //所有cell数据全部更新
        NSMutableArray *userItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            TableCellItemModel *item = [[TableCellItemModel alloc] init];
            item.name = [@(i) stringValue];
            item.height = 30;
            item.className = @"TableViewCell";
            [userItems addObject:item];
        }
        userSection.itemsModels = userItems.copy;
        
        //更新某个cell
        TableCellItemModel1 *item = (TableCellItemModel1 *)[self getItemModelWithSectionId:gameSectionId itemId:gameFirstItemId];
        //只更新title
        item.title = @"sdfdsfdsf";
        if (completion) {
            completion();
        }
    });
}
@end
