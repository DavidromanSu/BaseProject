//
//  Factory.h
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/**
 *   向某个控制器添加菜单按钮
 */
+(void)addMenuItemToVC:(UIViewController*)VC;
/**
 *  向控制器添加返回按钮
 */
+(void)addBackItemToVC:(UIViewController*)VC;
@end
