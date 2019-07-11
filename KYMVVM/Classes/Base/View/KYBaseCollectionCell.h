//
//  KYBaseCollectionCell.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYTableViewCellProtocol.h"
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYBaseCollectionCell : UICollectionViewCell
@property (nonatomic, weak) id<KYTableViewCellProtocol>delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy)   NSString *itemId;
@property (nonatomic, assign) BOOL denySelect;

@property (nonatomic, strong, nullable) RACCompoundDisposable *compoundDisposable;

/**
 cell中控件的点击事件

 @param sender sender 控件
 @param object 扩展参数
 */
- (void)actionWithSender:(nullable id)sender object:(nullable id)object;

/**
 双向绑定，并且自动合并Disposable
 为了方便重用时清除绑定
 */
- (void)mutualBindWithTerminal:(RACChannelTerminal *)terminal terminal1:(RACChannelTerminal *)terminal1;
@end

NS_ASSUME_NONNULL_END
