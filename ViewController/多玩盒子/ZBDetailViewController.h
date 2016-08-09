//
//  ZBDetailViewController.h
//  BaseProject
//
//  Created by davidroman on 16/8/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBDetailViewController : UIViewController
- (id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong) NSString *tag;
@end
