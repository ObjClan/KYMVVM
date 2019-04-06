//
//  KYBaseCellItemModel.h
//  KYMVVM
//
//  Created by Key on 26/03/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYBaseCellItemModel : KYBaseModel

/**
 在section中cell的唯一标识
 */
@property (nonatomic, copy) NSString *itemId;
/**
 cellw宽度，tableViewCell不用传
 */
@property (nonatomic, assign) CGFloat width;
/**
 cell高度，tableViewCell不用传
 */
@property (nonatomic, assign) CGFloat height;

/**
 该cell的类名
 */
@property (nonatomic, copy) NSString *className;

@end

NS_ASSUME_NONNULL_END
