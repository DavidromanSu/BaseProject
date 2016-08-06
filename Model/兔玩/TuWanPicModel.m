//
//  TuWanPicModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanPicModel.h"

@implementation TuWanPicModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanPicShowitemModel class], @"relevant" : [TuWanPicRelevantModel class], @"content" : [TuWanPicContentModel class]};
}

@end


@implementation TuWanPicInfochildModel

@end


@implementation TuWanPicShowitemModel

@end


@implementation TuWanPicShowItemInfoModel

@end


@implementation TuWanPicRelevantModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
}
@end


@implementation TuWanPicContentModel

@end


@implementation TuWanPicContentInfoModel

@end


