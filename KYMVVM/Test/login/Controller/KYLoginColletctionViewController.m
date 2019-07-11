//
//  KYLoginColletctionViewController.m
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYLoginColletctionViewController.h"
#import "KYLoginCollectionViewModel.h"
#import "KYLoginAccountCell.h"
#import "KYLoginItemModel.h"
#import "KYLoginVerifyCell.h"
#import "KYLoginSubmitCell.h"

@interface KYLoginColletctionViewController ()
@property (nonatomic, weak) KYLoginCollectionViewModel *rViewModel;
@end
@implementation KYLoginColletctionViewController
@synthesize viewModel = _viewModel;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.viewModel fetchDataWithIsRefresh:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}
- (KYTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[KYLoginCollectionViewModel alloc] init];
    }
    return _viewModel;
}
- (KYLoginCollectionViewModel *)rViewModel
{
    return (KYLoginCollectionViewModel *)self.viewModel;
}
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
 
}
- (void)loginAccountItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.keyboardType = UIKeyboardTypeDefault;
    [cell mutualBindWithTerminal: RACChannelTo(self.rViewModel,account) terminal1:cell.textField.rac_newTextChannel];
}
- (void)loginPasswordItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.secureTextEntry = YES;
    [cell mutualBindWithTerminal: RACChannelTo(self.rViewModel,password) terminal1:cell.textField.rac_newTextChannel];
}
- (void)loginPhoneItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
    [cell mutualBindWithTerminal: RACChannelTo(self.rViewModel,phoneNum) terminal1:cell.textField.rac_newTextChannel];
}
- (void)loginVerifyItemIdUpdateUIWithCell:(KYLoginVerifyCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    [cell mutualBindWithTerminal: RACChannelTo(self.rViewModel,verify) terminal1:cell.textField.rac_newTextChannel];
}
- (void)loginSubmitItemIdUpdateUIWithCell:(KYLoginSubmitCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    
}
- (void)loginVerifyItemIdCellAction:(KYLoginVerifyCell *)cell sender:(UIButton *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    cell.textField.sendStatus = KYSendCodeStatusSending;
    [self.rViewModel sendCodeWithCompletion:^(BOOL status, NSString * _Nonnull message) {
        if (status) {
            cell.textField.sendStatus = KYSendCodeStatusSent;
        } else {
            cell.textField.sendStatus = KYSendCodeStatusResend;
        }
    }];
}
- (void)loginSubmitItemIdCellAction:(KYLoginVerifyCell *)cell sender:(UIButton *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    cell.denySelect = YES;
    @weakify(self)
    [self.rViewModel loginWithCompletion:^(BOOL status, NSString * _Nonnull errorInfo) {
        NSLog(@"%@",errorInfo);
        @strongify(self)
        cell.denySelect = NO;
        [self.collectionView reloadData];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    [self.view endEditing:YES];;
}

@end
