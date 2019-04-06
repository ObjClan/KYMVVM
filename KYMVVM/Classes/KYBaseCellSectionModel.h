//
//  KYBaseCellSectionModel.h
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "KYBaseModel.h"
#import "KYBaseCellItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYBaseCellSectionModel : KYBaseModel
/**
 在tableview中section的唯一标识
 */
@property (nonatomic, copy) NSString *sectionId;

/**
 item列表
 */
@property (nonatomic, copy) NSArray<KYBaseCellItemModel *> *itemsModels;

/**
 headerHeight
 */
@property (nonatomic, assign) CGFloat headerHeight;

/**
 headerHeight
 */
@property (nonatomic, assign) CGFloat footerHeight;
@end

NS_ASSUME_NONNULL_END
