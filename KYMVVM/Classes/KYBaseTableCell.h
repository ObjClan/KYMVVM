//
//  KYBaseTableCell.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYBaseTableCell : UITableViewCell

/**
 创建cell，如果从xib创建，xib的identifler设置为cell的类名
 */
+ (KYBaseTableCell *)createWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
