//
//  TuWanViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
@implementation TuWanViewController
+(UINavigationController *)standardTuWanNavi{
    static UINavigationController* navi = nil;
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token, ^{
        TuWanViewController* vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
  
    [Factory addMenuItemToVC:self];
}
@end
