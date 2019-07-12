//
//  KYLoginCollectionViewModel.m
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYLoginCollectionViewModel.h"
#import "KYLoginCollectionCellSectionModel.h"

#import <ReactiveObjC/ReactiveObjC.h>

NSString * const firstSectionId = @"firstSectionId";
NSString * const secondSectionId = @"secondSectionId";

NSString * const loginAccountItemId   =  @"loginAccountItemId";
NSString * const loginPasswordItemId  =  @"loginPasswordItemId";
NSString * const loginPhoneItemId     =  @"loginPhoneItemId";
NSString * const loginVerifyItemId    =  @"loginVerifyItemId";
NSString * const loginSubmitItemId    =  @"loginSubmitItemId";

@implementation KYLoginCollectionViewModel

- (void)initData
{
    [self registerCellClass:@[@"KYLoginAccountCell"]];
    [self registerCellClass:@[@"KYLoginVerifyCell"]];
    [self registerCellClass:@[@"KYLoginSubmitCell"]];
    @weakify(self)
    RACSignal *accountSignal = [RACObserve(self, account) flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        @strongify(self)
        if ([self isCorrectAccount]) {
            return [RACSignal return:@YES];;
        }
        return [RACSignal return:@NO];
    }];
    RACSignal *pwdSignal = [RACObserve(self, password) flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        @strongify(self)
        if ([self isCorrectPassword]) {
            return [RACSignal return:@YES];;
        }
        return [RACSignal return:@NO];
    }];
    RACSignal *phoneNumSignal = [RACObserve(self, phoneNum) flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        @strongify(self)
        if ([self isCorrectPhoneNum]) {
            return [RACSignal return:@YES];;
        }
        return [RACSignal return:@NO];
    }];
    RACSignal *verifySignal = [RACObserve(self, verify) flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        @strongify(self)
        if ([self isCorrectVerfiy]) {
            return [RACSignal return:@YES];;
        }
        return [RACSignal return:@NO];
    }];
    RACSignal *allSignal = [RACSignal combineLatest:@[accountSignal,pwdSignal,phoneNumSignal,verifySignal] reduce:^id(NSNumber *account,NSNumber *pwd,NSNumber *phoneNum,NSNumber *verify){
        if ([account boolValue] && [pwd boolValue] && [phoneNum boolValue] && [verify boolValue]) {
            return @YES;
        }
        return @NO;
    }];
    [allSignal subscribeNext:^(id x) {
        self.allowSubmit = [x boolValue];
    }];
}
- (BOOL)isCorrectAccount
{
    if (self.account.length >= 6 && self.account.length <= 20) {
        return YES;
    }
    return NO;
}
- (BOOL)isCorrectPassword
{
    if (self.password.length >= 6 && self.password.length <= 20) {
        return YES;
    }
    return NO;
}
- (BOOL)isCorrectPhoneNum
{
    if (self.phoneNum.length == 11) {
        return YES;
    }
    return NO;
}
- (BOOL)isCorrectVerfiy
{
    if (self.verify.length == 6) {
        return YES;
    }
    return NO;
}
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh
{
    [super fetchDataWithIsRefresh:isRefresh];
    
    KYLoginCollectionCellSectionModel *section = [[KYLoginCollectionCellSectionModel alloc] init];
    section.sectionId = firstSectionId;
    section.minimumLineSpacing = 10;
    section.edgeInsets = UIEdgeInsetsMake(60, 10, 10, 10);
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    KYLoginItemModel *item = [[KYLoginItemModel alloc] init];
    item.itemId = loginAccountItemId;
    item.className = @"KYLoginAccountCell";
    item.width = [UIScreen mainScreen].bounds.size.width - 20;
    item.height = 50;
    item.leftTitle = @"用户名";
    item.placeholder = @"由6-20位字母和数字组成";
    item.errorInfo = @"用户名格式错误，需由6-20位字母和数字组成";
    [items addObject:item];
    
    KYLoginItemModel *item1 = [[KYLoginItemModel alloc] init];
    item1.itemId = loginPasswordItemId;
    item1.className = @"KYLoginAccountCell";
    item1.width = [UIScreen mainScreen].bounds.size.width - 20;
    item1.height = 50;
    item1.leftTitle = @"密    码";
    item1.placeholder = @"由6-20位字母和数字组成";
    item1.errorInfo = @"密码格式错误，需由6-20位字母和数字组成";
    [items addObject:item1];
    
    KYLoginItemModel *item2 = [[KYLoginItemModel alloc] init];
    item2.itemId = loginPhoneItemId;
    item2.className = @"KYLoginAccountCell";
    item2.width = [UIScreen mainScreen].bounds.size.width - 20;
    item2.height = 50;
    item2.leftTitle = @"手机号";
    item2.placeholder = @"请输入手机号";
    item2.errorInfo = @"手机号格式错误，需由11位数字组成";
    [items addObject:item2];
    
    KYLoginItemModel *item3 = [[KYLoginItemModel alloc] init];
    item3.itemId = loginVerifyItemId;
    item3.className = @"KYLoginVerifyCell";
    item3.width = [UIScreen mainScreen].bounds.size.width - 20;
    item3.height = 50;
    item3.leftTitle = @"验证码";
    item3.placeholder = @"输入验证码";
    item3.errorInfo = @"验证码格式错误，需由6位字母组成";
    [items addObject:item3];
    
    section.itemsModels = items.copy;
    
    KYLoginCollectionCellSectionModel *section1 = [[KYLoginCollectionCellSectionModel alloc] init];
    section1.sectionId = secondSectionId;
    section1.minimumLineSpacing = 10;
    section1.edgeInsets = UIEdgeInsetsMake(30, 10, 10, 10);
    
    NSMutableArray *items1 = [[NSMutableArray alloc] init];
    
    KYBaseCellItemModel *item4 = [[KYBaseCellItemModel alloc] init];
    item4.itemId = loginSubmitItemId;
    item4.className = @"KYLoginSubmitCell";
    item4.width = [UIScreen mainScreen].bounds.size.width - 20;
    item4.height = 50;
    
    [items1 addObject:item4];
    section1.itemsModels = items1.copy;
    
    self.sections = @[section,section1];
    
    [self fetchDataCompleteWithIsRefresh:YES errorInfo:nil dataArray:self.sections];
}
- (void)textFieldEndEditWithIsCorrect:(BOOL)isCorrect model:(KYLoginItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    if (isCorrect) {
        model.height = 50;
    } else {
        model.height = 70;
    }
    self.reloadIndexPaths = @[indexPath];
}
- (void)sendCodeWithCompletion:(void (^)(BOOL, NSString * _Nonnull))completion
{
    NSLog(@"手机号:%@",self.phoneNum);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion(YES,@"");
    });
}
- (void)loginWithCompletion:(void (^)(BOOL, NSString * _Nonnull))completion
{
    NSLog(@"用户名:%@--密码:%@--手机号:%@---验证码:%@",self.account,self.password,self.phoneNum,self.verify);
    self.allowSubmit = NO;
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        completion(NO,@"登录失败,密码错误");
        self.allowSubmit = YES;
        self.shouldReloadData = YES;
    });
}

@end
