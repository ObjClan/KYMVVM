//
//  TableView1Cell.m
//  KYMVVM
//
//  Created by Key on 06/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "TableView1Cell.h"

@implementation TableView1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnClicked:(id)sender {
    [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:@(1)];
}
- (IBAction)btn1Clicked:(id)sender {
    [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:@(2)];
}
- (IBAction)switch:(id)sender {
    [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:@(3)];
}

@end
