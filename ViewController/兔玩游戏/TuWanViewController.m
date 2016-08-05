//
//  TuWanViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListViewController.h"
@interface TuWanViewController()
@end
@implementation TuWanViewController
+(UINavigationController *)standardTuWanNavi{
    static UINavigationController* navi = nil;
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token, ^{
        TuWanViewController* vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
+(NSArray*)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
        
    }
    return [arr copy];
}
+(NSArray*)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<[self itemNames].count; i++) {
        [arr addObject:@(i)];
    }
    return [arr copy];
}
/**
 *  提供题目数组
 */
+(NSArray*)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
+(NSArray*)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
        
    }
    return [arr copy];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
  
    [Factory addMenuItemToVC:self];
}
@end
