//
//  RankingListModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RankingListModel.h"

@implementation RankingListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RankListListModel class]};
}
@end

@implementation RankListListModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}
@end





