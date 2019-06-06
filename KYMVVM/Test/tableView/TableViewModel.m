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
    self.currentPage = 0;
    self.pageCount = 20;
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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadMoreDataComplete];
        });
    }
}
- (void)refreshDataComplete
{
    //第一个section
    KYBaseCellSectionModel *userSection = [[KYBaseCellSectionModel alloc] init];
    userSection.sectionId = userSectionId;
    userSection.headerHeight = 80;
    
    //创建第1组的cell数据
    NSMutableArray *userItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        TableCellItemModel *item = [[TableCellItemModel alloc] init];
        item.itemId = @"";
        item.height = 80;
        item.className = @"TableViewCell";
        item.name = [NSString stringWithFormat:@"userItem_%d",i];
        [userItems addObject:item];
    }
    userSection.itemsModels = userItems.copy;
    
    //第二个section
    KYBaseCellSectionModel *gameSection = [[KYBaseCellSectionModel alloc] init];
    gameSection.sectionId = gameSectionId;
    //    gameSection.footerHeight = 50;
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
    
    [self fetchDataCompleteWithIsRefresh:YES errorInfo:nil dataArray:self.sections];
}
- (void)loadMoreDataComplete
{
    //更新section
    KYBaseCellSectionModel *gameSection = (KYBaseCellSectionModel *)[self getSectionModelWithId:gameSectionId];
    
    NSMutableArray *gameItems = (gameSection.itemsModels).mutableCopy;
    
    //无更多数据
    if (gameSection.itemsModels.count > 50) {
        self.loadDataStatus = KYLoadDataStatusNomore;
        return;
    }
    for (NSInteger i = gameSection.itemsModels.count; i < gameSection.itemsModels.count + 20; i++) {
        TableCellItemModel1 *item = [[TableCellItemModel1 alloc] init];
        item.height = 70;
        item.className = @"TableView1Cell";
        item.title = [@(i) stringValue];
        [gameItems addObject:item];
    }
    gameSection.itemsModels = gameItems.copy;
    
    [self fetchDataCompleteWithIsRefresh:NO errorInfo:nil dataArray:gameSection.itemsModels];
}
//更新某个cell
- (void)updateOneCellContent
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //获取cell的model
        TableCellItemModel1 *item = (TableCellItemModel1 *)[self getItemModelWithSectionId:gameSectionId itemId:gameFirstItemId];
        //只更新title
        item.title = @"sdfdsfdsf";
        //获取cell的indexPath
        NSIndexPath *indexPath = [self getIndexPathWithSectionId:gameSectionId itemId:gameFirstItemId];
        //设置需要刷新的indexpath
        self.reloadIndexPaths = @[indexPath];
    });
}
//更新非cell内容
- (void)fetchTitle
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.title = @"哈哈啊啊";
    });
}
@end
