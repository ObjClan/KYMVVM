//
//  KYBaseViewController.h
//  KYMVVM
//
//  Created by object_lan on 2019/3/31.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYBaseViewModel.h"
@interface KYBaseViewController : UIViewController
@property (strong, nonatomic) KYBaseViewModel *viewModel;
@end
