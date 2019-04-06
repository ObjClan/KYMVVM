//
//  TableViewModel.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}
- (void)initData
{
    TableCellSectionModel *headerSection = [[TableCellSectionModel alloc] init];
    headerSection.sectionId = @"headerSecion";
    headerSection.headerHeight = 20;
    headerSection.footerHeight = 10;
    NSMutableArray *headerItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        TableCellItemModel *item = [[TableCellItemModel alloc] init];
        item.itemId = [NSString stringWithFormat:@"itemId0-%d",i];
        item.height = 80;
        item.className = @"TableViewCell";
        [headerItems addObject:item];
    }
    headerSection.itemsModels = headerItems.copy;

    TableCellSectionModel *footSection = [[TableCellSectionModel alloc] init];
    footSection.sectionId = @"footerSecion";
    footSection.headerHeight = 20;
    footSection.footerHeight = 10;
    NSMutableArray *footerItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < 20; i++) {
        TableCellItemModel *item = [[TableCellItemModel alloc] init];
        item.itemId = [NSString stringWithFormat:@"itemId1-%d",i];
        item.height = 50;
        item.className = @"TableView1Cell";
        [footerItems addObject:item];
    }
    footSection.itemsModels = footerItems.copy;
    
    self.sections = @[headerSection,footSection];
    
}
- (void)fetchDataWithCompletion:(void (^)(void))completion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        TableCellItemModel *item = (TableCellItemModel *)[self getItemModelWithSectionId:@"footerSecion" itemId:@"itemId1-4"];
        item.itemId = @"sdfdsfdsf";
        if (completion) {
            completion();
        }
    });
}
@end
