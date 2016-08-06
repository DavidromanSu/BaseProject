//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"

@implementation TuWanPicViewModel
-(id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
-(instancetype)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getPicDetailWithID:self.aid completionHandle:^(TuWanPicModel* model, NSError *error) {
        self.dataArr = [model.content copy];
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSURL *)picURLForRow:(NSInteger)row{
    TuWanPicContentModel* model = self.dataArr[row];
    
    return [NSURL URLWithString:model.pic];
}
@end
