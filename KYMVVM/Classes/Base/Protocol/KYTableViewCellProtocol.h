//
//  KYTableViewCellProtocol.h
//  KYMVVM
//
//  Created by Key on 12/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KYTableViewCellProtocol <NSObject>

@optional
/**
 cell中某个子控件的点击事件
 @param cell cell
 @param sender 被点击的控件
 @param indexPath indexpath
 @param object 扩展对象
 */
- (void)cellAction:(id)cell sender:(UIView *)sender indexPath:(NSIndexPath *)indexPath object:(nullable id)object;
@end

NS_ASSUME_NONNULL_END
