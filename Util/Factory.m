//
//  Factory.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
+(void)addMenuItemToVC:(UIViewController *)VC{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    btn.frame =CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [VC.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    VC.navigationItem.leftBarButtonItems = @[spaceItem,btItem];
}
@end
