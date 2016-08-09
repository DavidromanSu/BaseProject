//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController
-(id)initWithRequest:(NSURLRequest*)request;
@property(nonatomic,strong)NSURLRequest *request;

@end
