//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"
#import "DuoWanNetManager.h"
#import "ToolMenuModel.h"
@implementation ToolMenuViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
- (ToolMenuModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
- (NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}

- (NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
-(ToolMenuItemType)itemTypeForRow:(NSInteger)row{
    return [[self modelForRow:row].type isEqualToString:@"web"]?1:0;
}
@end
