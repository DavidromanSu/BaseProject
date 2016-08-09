//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"
#import "DuoWanNetManager.h"
#import "ZBCategoryModel.h"
@implementation ZBCategoryViewModel
-(NSInteger)rowNum{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(ZBCategoryModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
@end
