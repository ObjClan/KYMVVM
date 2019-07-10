//
//  KYBaseTableCell.m
//  KYMVVM
//
//  Created by Key on 05/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "KYBaseTableCell.h"
#import <objc/message.h>
@interface KYBaseTableCell ()
@property (nonatomic, weak, readwrite) id<KYTableViewCellProtocol>delegate;
@property (nonatomic, strong, readwrite) NSIndexPath *indexPath;
@property (nonatomic, copy, readwrite)   NSString *itemId;
@end
@implementation KYBaseTableCell

+ (KYBaseTableCell *)createWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath delegate:(id<KYTableViewCellProtocol>)delegate itemId:(NSString *)itemId
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
        cell.delegate = delegate;
    }
    cell.indexPath = indexPath;
    cell.itemId = itemId;
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
- (void)actionWithSender:(nullable id)sender object:(nullable id)object
{
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@CellAction:sender:indexPath:object:",self.itemId]);
    if ([self.delegate respondsToSelector:sel]) {
        void (*action)(id, SEL, KYBaseTableCell *, UIButton *,NSIndexPath *,id) =
        (void (*)(id, SEL, KYBaseTableCell *, UIButton *,NSIndexPath *,id)) objc_msgSend;
        action(self.delegate,sel,self,sender,self.indexPath,object);
    } else {
        if ([self.delegate respondsToSelector:@selector(cellAction:sender:indexPath:object:)]) {
            [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:object];
        }
    }
}
- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}
@end
