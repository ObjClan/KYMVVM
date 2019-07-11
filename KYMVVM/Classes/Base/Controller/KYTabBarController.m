//
//  KYTabBarController.m
//  KYMVVM
//
//  Created by object_lan on 2019/4/1.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import "KYTabBarController.h"

@interface KYTabBarController ()

@end

@implementation KYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return [self.selectedViewController preferredStatusBarStyle];
}
- (BOOL)prefersStatusBarHidden
{
    return [self.selectedViewController prefersStatusBarHidden];
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return self.selectedViewController.preferredStatusBarUpdateAnimation;
}
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
