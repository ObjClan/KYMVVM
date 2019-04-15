//
//  KYBaseCollectionCell.h
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYTableViewCellProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface KYBaseCollectionCell : UICollectionViewCell
@property (nonatomic, weak) id<KYTableViewCellProtocol>delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
