//
//  TableViewModel.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYTableViewModel.h"
#import "TableCellItemModel.h"
#import "TableCellItemModel1.h"
NS_ASSUME_NONNULL_BEGIN

@interface TableViewModel : KYTableViewModel
@property (nonatomic, copy) NSString *title;
//更新某个cell
- (void)updateOneCellContent;
- (void)fetchTitle;
@end

NS_ASSUME_NONNULL_END
