//
//  KYBaseTableCell.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseTableCell.h"

@implementation KYBaseTableCell

+ (KYBaseTableCell *)createWithTableView:(UITableView *)tableView
{
    NSString *identifier = NSStringFromClass([self class]);
    KYBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    Class cellClass = [self class];
    if (!cell) {
        NSString *cellClassString = NSStringFromClass(cellClass);
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:cellClassString ofType:@"nib"];
        if (!nibPath || ![[NSFileManager defaultManager] fileExistsAtPath:nibPath]) {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        } else {
            UINib *nib = [UINib nibWithNibName:cellClassString bundle:nil];
            [tableView registerNib:nil forCellReuseIdentifier:identifier];
            cell = [nib instantiateWithOwner:nib options:nil].firstObject;
        }
        return cell;
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
