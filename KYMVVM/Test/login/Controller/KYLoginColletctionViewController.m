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
- (void)updateUIWithCell:(UICollectionViewCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
 
}
- (void)loginAccountItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.keyboardType = UIKeyboardTypeDefault;
    RACChannelTo(viewModel,account) = cell.textField.rac_newTextChannel;
}
- (void)loginPasswordItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.secureTextEntry = YES;
    RACChannelTo(viewModel,password) = cell.textField.rac_newTextChannel;
}
- (void)loginPhoneItemIdUpdateUIWithCell:(KYLoginAccountCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
    RACChannelTo(viewModel,phoneNum) = cell.textField.rac_newTextChannel;
}
- (void)loginVerifyItemIdUpdateUIWithCell:(KYLoginVerifyCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.textField.leftTitle = model.leftTitle;
    cell.textField.placeholder = model.placeholder;
    RACChannelTo(viewModel,verify) = cell.textField.rac_newTextChannel;
}
- (void)loginSubmitItemIdUpdateUIWithCell:(KYLoginSubmitCell *)cell model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
}
- (void)loginVerifyItemIdCellAction:(KYLoginVerifyCell *)cell sender:(UIButton *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.textField.sendStatus = KYSendCodeStatusSending;
    [viewModel sendCodeWithCompletion:^(BOOL status, NSString * _Nonnull message) {
        if (status) {
            cell.textField.sendStatus = KYSendCodeStatusSent;
        } else {
            cell.textField.sendStatus = KYSendCodeStatusResend;
        }
    }];
}
- (void)loginSubmitItemIdCellAction:(KYLoginVerifyCell *)cell sender:(UIButton *)sender indexPath:(NSIndexPath *)indexPath object:(id)object
{
    KYLoginCollectionViewModel *viewModel = (KYLoginCollectionViewModel *)self.viewModel;
    cell.denySelect = YES;
    [viewModel loginWithCompletion:^(BOOL status, NSString * _Nonnull errorInfo) {
        NSLog(@"%@",errorInfo);
        cell.denySelect = NO;
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    [self.view endEditing:YES];;
}

@end
