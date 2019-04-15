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
/**
 section的minimumLineSpacing
 */
@property (nonatomic, assign) CGFloat minimumLineSpacing;
/**
 section的minimumInteritemSpacing
 */
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/**
section的edgeInsets
*/
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end

NS_ASSUME_NONNULL_END
