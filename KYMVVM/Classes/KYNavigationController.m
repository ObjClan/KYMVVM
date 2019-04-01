//
//  KYNavigationController.m
//  KYMVVM
//
//  Created by object_lan on 2019/4/1.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import "KYNavigationController.h"

@interface KYNavigationController ()

@end

@implementation KYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
