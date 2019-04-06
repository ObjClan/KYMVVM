//
//  KYTableVIewModel.h
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYBaseViewModel.h"
#import "KYBaseCellSectionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYTableViewModel : KYBaseViewModel
@property (nonatomic, strong) NSArray<KYBaseCellSectionModel *> *sections;
- (KYBaseCellSectionModel *)getSectionModelWithId:(NSString *)sectionId;
- (KYBaseCellItemModel *)getItemModelWithSectionId:(NSString *)sectionId itemId:(NSString *)itemId;
@end

NS_ASSUME_NONNULL_END
