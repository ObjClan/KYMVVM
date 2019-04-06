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
@property (nonatomic, assign) BOOL shouldReload;
- (void)fetchTitle;
@end

NS_ASSUME_NONNULL_END
