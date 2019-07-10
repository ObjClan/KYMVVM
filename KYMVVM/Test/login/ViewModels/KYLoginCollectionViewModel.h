//
//  KYLoginCollectionViewModel.h
//  KYMVVMDemo
//
//  Created by Key on 05/07/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYTableViewModel.h"



NS_ASSUME_NONNULL_BEGIN

extern NSString * const firstSectionId;
extern NSString * const secondSectionId;

extern NSString * const loginAccountItemId;
extern NSString * const loginPasswordItemId;
extern NSString * const loginPhoneItemId;
extern NSString * const loginVerifyItemId;
extern NSString * const loginSubmitItemId;

@interface KYLoginCollectionViewModel : KYTableViewModel
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *phoneNum;
@property (nonatomic, copy) NSString *verify;


- (void)sendCodeWithCompletion:(void (^)(BOOL, NSString * _Nonnull))completion;
- (void)loginWithCompletion:(void (^)(BOOL, NSString * _Nonnull))completion;
@end

NS_ASSUME_NONNULL_END
