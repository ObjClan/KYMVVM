//
//  KYBaseViewModel.m
//  KYMVVM
//
//  Created by object_lan on 2019/4/1.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import "KYBaseViewModel.h"

@implementation KYBaseViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}
- (void)initData
{
    
}
- (void)fetchDataWithIsRefresh:(BOOL)isRefresh
{
    
}
- (void)fetchDataCompleteWithIsRefresh:(BOOL)isRefresh errorInfo:(NSString *)errorInfo dataArray:(NSArray *)dataArray
{
    
}
@end
