//
//  KYBaseTableCell.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYTableViewCellProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYBaseTableCell : UITableViewCell
@property (nonatomic, weak) id<KYTableViewCellProtocol>delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
/**
 创建cell，如果从xib创建，xib的identifler设置为cell的类名
 */
+ (KYBaseTableCell *)createWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath delegate:(id<KYTableViewCellProtocol>)delegate;
@end

NS_ASSUME_NONNULL_END
