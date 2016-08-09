//
//  HeroViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroViewController.h"

@interface HeroViewController ()

@end

@implementation HeroViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"英雄";
    }return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
