//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
-(instancetype)initWithType:(InfoType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
-(id)init{
    if ((self = [super init])) {
        NSAssert(NO, @"%s 必须使用initWithType初始化",__func__);
    }
    return self;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start+=11;
    [self getDataFromNetCompleteHandle:completionHandle];
    
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getTuWanInfoWithType:self.type start:self.start completionHandle:^(TuWanModel *model, NSError *error) {
        if (self.start==0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
            
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr=model.data.indexpic;
        
        completionHandle(error);
    }];
    
}
-(BOOL)isExistIndexPic{
    return self.indexPicArr !=nil&&self.indexPicArr.count!=0;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(TuWanDataIndexpicModel*)modelForArr:(NSArray*)arr row:(NSInteger)row{
    return arr[row];
}
-(bool)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}
-(NSString*)titleForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}
-(NSURL*)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic] ;
}
-(NSString*)descForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].longtitle;
}
-(NSString*)clickForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].click;
}
-(NSURL*)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic] ;
}
-(NSString*)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}
-(NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}
-(NSURL *)detailURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5] ;
}
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5] ;
}
-(NSArray *)iconsURLForRowInList:(NSInteger)row{
    NSArray *arr = [self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *array = [NSMutableArray new];
    for (int i=0; i<arr.count; i++) {
        TuWanDataIndexpicShowitemModel *model = arr[i];
        [array addObject:model.pic];
    }
    return [array copy];
}
@end
