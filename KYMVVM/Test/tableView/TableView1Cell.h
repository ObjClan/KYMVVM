//
//  TableView1Cell.h
//  KYMVVM
//
//  Created by Key on 06/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableView1Cell : KYBaseTableCell
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@end

NS_ASSUME_NONNULL_END
