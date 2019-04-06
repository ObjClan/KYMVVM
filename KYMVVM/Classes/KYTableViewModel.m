//
//  KYTableVIewModel.m
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTableViewModel.h"

@implementation KYTableViewModel
- (KYBaseCellSectionModel *)getSectionModelWithId:(NSString *)sectionId
{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"sectionId = %@",sectionId];
    NSArray *arry = [self.sections filteredArrayUsingPredicate:pre];
    if (arry && arry.count > 0) {
        return [arry firstObject];
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
    NSArray *arry = [section.itemsModels filteredArrayUsingPredicate:pre];
    if (arry && arry.count > 0) {
        return [arry firstObject];
    }
    return nil;
}
@end
