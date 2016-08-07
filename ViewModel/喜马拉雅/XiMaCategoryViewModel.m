//
//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"
#import "XiMalaya.h"
@implementation XiMaCategoryViewModel

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.pageId=1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.pageId+=1;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [XiMaNetManager getRankListWithPageId:self.pageId completionHandle:^(RankingListModel* model, NSError *error) {
        if (self.pageId == 1) {
            [self.dataArr removeAllObjects];
            
        }
        [self.dataArr addObjectsFromArray:model.list];
        completionHandle(error);
    }];
    
}
-(NSInteger)rowNum{
    return self.dataArr.count;
}
-(RankListListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)introForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
-(NSString *)tracksForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集",(long)[self modelForRow:row].tracks];
    
}
-(NSURL *)albumCoverURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290] ;
}
-(NSInteger)albumIdForRow:(NSInteger)row{
    return [self modelForRow:row].albumId;
}
@end
