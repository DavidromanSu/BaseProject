
//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"
#import "BestGroupModel.h"
@implementation BestGroupViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(BestGroupModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSInteger)rowNum{
    return self.dataArr.count;
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}
-(NSArray *)descsForRow:(NSInteger)row{
    return @[[self modelForRow:row].des1,[self modelForRow:row].des2,[self modelForRow:row].des3,[self modelForRow:row].des4,[self modelForRow:row].des5];
    
}
-(NSArray *)heroIconsForRow:(NSInteger)row{
    return @[kIconPathWithEnName([self modelForRow:row].hero1),kIconPathWithEnName([self modelForRow:row].hero2),kIconPathWithEnName([self modelForRow:row].hero3),kIconPathWithEnName([self modelForRow:row].hero4),kIconPathWithEnName([self modelForRow:row].hero5)];
}
@end
