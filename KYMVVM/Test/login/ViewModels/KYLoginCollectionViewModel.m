//
//  KYLoginCollectionViewModel.m
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYLoginCollectionViewModel.h"
#import "KYLoginCollectionCellSectionModel.h"
#import "KYLoginItemModel.h"

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
    [items addObject:item];
    
    KYLoginItemModel *item1 = [[KYLoginItemModel alloc] init];
    item1.itemId = loginPasswordItemId;
    item1.className = @"KYLoginAccountCell";
    item1.width = [UIScreen mainScreen].bounds.size.width - 20;
    item1.height = 50;
    item1.leftTitle = @"密    码";
    item1.placeholder = @"由6-20位字母和数字组成";
    [items addObject:item1];
    
    KYLoginItemModel *item2 = [[KYLoginItemModel alloc] init];
    item2.itemId = loginPhoneItemId;
    item2.className = @"KYLoginAccountCell";
    item2.width = [UIScreen mainScreen].bounds.size.width - 20;
    item2.height = 50;
    item2.leftTitle = @"手机号";
    item2.placeholder = @"请输入手机号";
    [items addObject:item2];
    
    KYLoginItemModel *item3 = [[KYLoginItemModel alloc] init];
    item3.itemId = loginVerifyItemId;
    item3.className = @"KYLoginVerifyCell";
    item3.width = [UIScreen mainScreen].bounds.size.width - 20;
    item3.height = 50;
    item3.leftTitle = @"验证码";
    item3.placeholder = @"输入验证码";
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion(NO,@"登录失败,密码错误");
    });
}
@end
