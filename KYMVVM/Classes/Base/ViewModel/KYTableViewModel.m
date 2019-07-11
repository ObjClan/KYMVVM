//
//  KYTableVIewModel.m
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTableViewModel.h"

@implementation KYTableViewModel
- (NSMutableArray<NSString *> *)cellClassNames
{
    if (!_cellClassNames) {
        _cellClassNames = [[NSMutableArray alloc] init];
    }
    return _cellClassNames;
}
- (KYBaseCellSectionModel *)getSectionModelWithId:(NSString *)sectionId
{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"sectionId = %@",sectionId];
    NSArray *array = [self.sections filteredArrayUsingPredicate:pre];
    if (array && array.count > 0) {
        return [array firstObject];
    }
    return nil;
}
- (KYBaseCellItemModel *)getItemModelWithSectionId:(NSString *)sectionId itemId:(NSString *)itemId
{
    KYBaseCellSectionModel *section = [self getSectionModelWithId:sectionId];
    if (!section || section.itemsModels.count <= 0) {
        return nil;
    }
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"itemId = %@",itemId];
    NSArray *array = [section.itemsModels filteredArrayUsingPredicate:pre];
    if (array && array.count > 0) {
        return [array firstObject];
    }
    return nil;
}
- (NSIndexPath *)getIndexPathWithSectionId:(NSString *)sectionId itemId:(NSString *)itemId
{
    KYBaseCellSectionModel *sectionModel = [self getSectionModelWithId:sectionId];
    if (!sectionModel || sectionModel.itemsModels.count <= 0) {
        return nil;
    }
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"itemId = %@",itemId];
    NSArray *array = [sectionModel.itemsModels filteredArrayUsingPredicate:pre];
    if (array && array.count > 0) {
        id item = [array firstObject];
        NSUInteger section = [self.sections indexOfObject:sectionModel];
        NSUInteger row = [sectionModel.itemsModels indexOfObject:item];
        return [NSIndexPath indexPathForRow:row inSection:section];
    }
    return nil;
}
- (void)registerCellClass:(NSArray<NSString *> *)classNames
{
    for (NSString *name in classNames) {
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"self = %@",name];
        NSArray *array = [self.cellClassNames filteredArrayUsingPredicate:pre];
        if (array && array.count > 0) {
            return;
        }
        [self.cellClassNames addObject:name];
    }
}
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh
{
    [super fetchDataWithIsRefresh:isRefresh];
    self.loadDataStatus = isRefresh ? KYLoadDataStatusPullDownLoading : KYLoadDataStatusPullUpLoading;
}
- (void)fetchDataCompleteWithIsRefresh:(BOOL)isRefresh errorInfo:(NSString *)errorInfo dataArray:(NSArray *)dataArray
{
    [super fetchDataCompleteWithIsRefresh:isRefresh errorInfo:errorInfo dataArray:dataArray];
    self.errorInfo = errorInfo;
    if (isRefresh) {
        if (errorInfo) {
            self.loadDataStatus = KYLoadDataStatusPullDownFaild;
            return;
        }
        if (dataArray.count == 0) {
            self.loadDataStatus = KYLoadDataStatusPullDownEmpty;
            return;
        }
        self.loadDataStatus = KYLoadDataStatusPullDownSuccess;
        
    } else {
        if (errorInfo) {
            self.loadDataStatus = KYLoadDataStatusPullUpFaild;
            return;
        }
        if (dataArray.count < self.pageCount) {
            self.loadDataStatus = KYLoadDataStatusNomore;
            return;
        }
        self.loadDataStatus = KYLoadDataStatusPullUpSuccess;
    }
}
@end
