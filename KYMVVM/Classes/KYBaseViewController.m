//
//  KYBaseViewController.m
//  KYMVVM
//
//  Created by object_lan on 2019/3/31.
//  Copyright © 2019年 object_lan. All rights reserved.
//

#import "KYBaseViewController.h"

@interface KYBaseViewController ()

@end

@implementation KYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    [self setSubViewConstraints];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (BOOL)shouldAutorotate
{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)addSubViews
{
   
}
- (void)setSubViewConstraints
{

}

@end
