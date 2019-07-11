//
//  KYTemplateCollectionViewModel.m
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTemplateCollectionViewModel.h"
#import "KYTemplateCollectionItemModel.h"
#import "KYTemplateCollectionSectionModel.h"
static NSString *const firstSectionId = @"firstSectionId";
@implementation KYTemplateCollectionViewModel
- (void)initData
{
    self.pageCount = 20;
    self.currentPage = 0;
    [self registerCellClass:@[@"KYTemplateCollectionViewCell"]];
}
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh
{
    [super fetchDataWithIsRefresh:isRefresh];
    if (isRefresh) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            KYTemplateCollectionSectionModel *section = [[KYTemplateCollectionSectionModel alloc] init];
            section.sectionId = firstSectionId;
            section.headerHeight = 0;
            section.footerHeight = 0;
            section.minimumLineSpacing = 10;
            section.minimumInteritemSpacing = 0;
            section.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
            NSMutableArray *items = [[NSMutableArray alloc] init];
            for (int i = 0; i < self.pageCount; i++) {
                KYTemplateCollectionItemModel *item = [[KYTemplateCollectionItemModel alloc] init];
                item.itemId = @"";
                item.className = @"KYTemplateCollectionViewCell";
                item.width = 100;
                item.height = 100;
                [items addObject:item];
            }
            section.itemsModels = items.copy;
            self.sections = @[section];
            [self fetchDataCompleteWithIsRefresh:YES errorInfo:nil dataArray:self.sections];
        });
        
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            KYTemplateCollectionSectionModel *section = (KYTemplateCollectionSectionModel *)[self getSectionModelWithId:firstSectionId];
            NSMutableArray *items = (section.itemsModels).mutableCopy;
            NSMutableArray *addItems = @[].mutableCopy;
            for (NSInteger i = 0; i < 15; i++) {
                KYTemplateCollectionItemModel *item = [[KYTemplateCollectionItemModel alloc] init];
                item.width = 100;
                item.height = 100;
                item.className = @"KYTemplateCollectionViewCell";
                [addItems addObject:item];
            }
            [items addObjectsFromArray:addItems.copy];
            section.itemsModels = items.copy;
            
            [self fetchDataCompleteWithIsRefresh:NO errorInfo:nil dataArray:addItems];
        });
    }
    
}
@end
