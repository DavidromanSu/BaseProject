//
//  DuoWanTabBarController.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DuoWanTabBarController.h"
#import "HeroViewController.h"
#import "BaikeViewController.h"
#import "SearchViewController.h"
@implementation DuoWanTabBarController
+(DuoWanTabBarController *)standardInstance{
    static DuoWanTabBarController* vc=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [DuoWanTabBarController new];
    });
    return vc;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.translucent=NO;
  //  self.tabBar.hidden = YES;
    HeroViewController *heroVC = [HeroViewController new];
    BaikeViewController *baikeVC = [BaikeViewController new];
    SearchViewController *searchVC=[SearchViewController new];
    UINavigationController *heroNV = [[UINavigationController alloc]initWithRootViewController:heroVC];
     UINavigationController *baikeNV = [[UINavigationController alloc]initWithRootViewController:baikeVC];
     UINavigationController *searchNV = [[UINavigationController alloc]initWithRootViewController:searchVC];
    self.viewControllers=@[heroNV,baikeNV,searchNV];
    
}
@end
