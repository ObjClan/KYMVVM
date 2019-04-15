//
//  KYTableVIewModel.m
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTableViewModel.h"

@implementation KYTableViewModel
- (NSMutableArray<NSString *> *)cellNames
{
    if (!_cellNames) {
        _cellNames = [[NSMutableArray alloc] init];
    }
    return _cellNames;
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
- (void)registerCellName:(NSString *)name
{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"self = %@",name];
    NSArray *array = [self.cellNames filteredArrayUsingPredicate:pre];
    if (array && array.count > 0) {
        return;
    }
    [self.cellNames addObject:name];
}
@end
