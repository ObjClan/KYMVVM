//
//  KYBaseViewModel.h
//  KYMVVM
//
//  Created by object_lan on 2019/4/1.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KYBaseViewModel : NSObject
- (void)initData;
- (void)fetchDataWithCompletion:(void(^)(void))completion;
@end
