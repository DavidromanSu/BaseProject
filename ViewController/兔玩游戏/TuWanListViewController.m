//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by davidroman on 16/8/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
@interface TuWanListViewController()
@property (nonatomic,strong)TuWanViewModel *tuwanVM;

@end
@implementation TuWanListViewController
-(TuWanViewModel *)tuwanVM{
    if (_tuwanVM == nil) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}

@end
