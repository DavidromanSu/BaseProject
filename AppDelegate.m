//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window.rootViewController=self.sideMenu;
    [self configGlobalUIStyle];

    return YES;
}
-(void)configGlobalUIStyle{
    /**
     *  设置导航栏不透明
     */
    [[UINavigationBar appearance]setTranslucent:NO];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]setTitleTextAttributes: @{NSFontAttributeName:[UIFont flatFontOfSize:knaviTileFontSize],NSForegroundColorAttributeName:knaviTileColor}];
    
}
-(RESideMenu*)sideMenu{
    if (!_sideMenu) {
     _sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        
        _sideMenu.backgroundImage = [UIImage imageNamed:@"a4816418"];
        _sideMenu.menuPrefersStatusBarHidden = YES;
        _sideMenu.bouncesHorizontally=NO;
    }
    return _sideMenu;
}
-(UIWindow*)window{
    if (!_window) {
        
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
@end
