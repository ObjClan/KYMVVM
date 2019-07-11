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
    /*
    self.navigationBar.translucent = NO; //是否透明
    self.navigationBar.titleTextAttributes = nil; //title样式
    self.navigationBar.barTintColor = nil;//背景色
    [self.navigationBar setShadowImage:[UIImage new]]; //
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
     */
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return [self.topViewController preferredStatusBarStyle];
}
- (BOOL)prefersStatusBarHidden
{
    return [self.topViewController prefersStatusBarHidden];
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return self.topViewController.preferredStatusBarUpdateAnimation;
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
