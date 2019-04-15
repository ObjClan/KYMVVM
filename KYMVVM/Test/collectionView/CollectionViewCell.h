//
//  CollectionViewCell.h
//  KYMVVM
//
//  Created by Key on 10/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseCollectionCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : KYBaseCollectionCell
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

@end

NS_ASSUME_NONNULL_END
