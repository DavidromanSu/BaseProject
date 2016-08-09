//
//  ZBDetailViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBDetailViewModel.h"
#import "ZBItemModel.h"



@implementation ZBDetailViewModel
- (id)initWithTag:(NSString *)tag{
    if (self = [super init]) {
        self.tag = tag;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuoWanNetManager getZBItemListWithTag:_tag completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}
- (ZBItemModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)itemNameForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png", [self modelForRow:row].ID]];
}
- (NSInteger)itemIdForRow:(NSInteger)row{
    return [self modelForRow:row].ID;
}
@end