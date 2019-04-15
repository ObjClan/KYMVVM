//
//  GameCell.m
//  KYMVVM
//
//  Created by Key on 11/04/2019.
//  Copyright © 2019 object_lan. All rights reserved.
//

#import "GameCell.h"

@implementation GameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)addBtnClicked:(id)sender {
    [self.delegate cellAction:self sender:sender indexPath:self.indexPath object:nil];
}

@end
