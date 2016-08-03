//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by davidroman on 16/8/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#define kOSType       @"OSType": [@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion] //获取当前系统版本号

#define kVersionName    @"versionName": @"2.4.0"
#define kV              @"v": @140

#define kChangeKey(key)    [dic setObject:[dic objectForKey:[enName stringByAppendingString:key]]\
forKey:[@"desc" stringByAppendingString:key]];\
[dic removeObjectForKey:[enName stringByAppendingString:key]]
#import "DuoWanRequestPath.h"

@implementation DuoWanNetManager

+ (id)getHeroWithType:(HeroType)type completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, kV}];
    switch (type) {
        case HeroTypeFree:{
            [params setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll:{
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        default:{
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    
    return [self GET:kHeroPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree:{
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
            }
                break;
            case HeroTypeAll:{
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
            }
                break;
            default:
                completionHandle(nil,error);
                break;
        }
    }];
}



+ (id)getHeroSkinsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSkinPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
+ (id)getHeroSoundWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSoundPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        //Json数据就是标准数组，不需要解析
        completionHandle(responseObj, error);
    }];
}

+ (id)getHeroVideosWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroVideoPath parameters:@{kVersionName, kOSType, @"action": @"l", @"p": @(page), @"src": @"letv", @"tag": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroCZPath parameters:@{kV, kOSType, @"limit": @7, @"championName": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+(id)getHeroDetailWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroDetailPath parameters:@{kV, kOSType, @"heroName": enName} completionHandler:^(id responseObj, NSError *error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObj];
       
        kChangeKey(@"_R");
        kChangeKey(@"_W");
        kChangeKey(@"_B");
        kChangeKey(@"_E");
        kChangeKey(@"_Q");
        completionHandle([HeroDetailModel objectWithKeyValues:dic], error);
    }];
}
+ (id)getHeroGiftAndRun:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftAndRunPath parameters:@{kV, kOSType, @"hero": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroInfoWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroInfoPath parameters:@{kV, kOSType, @"name": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId": @(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{kV, kVersionName, kOSType, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBCategoryCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBCategoryPath parameters:@{} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBItemListWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBItemListPath parameters:@{@"tag": tag, kV, kOSType, kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getItemDetailWithItemId:(NSInteger)itemId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kItemDetailPath parameters:@{kV, kOSType, @"id": @(itemId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getGIftCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GiftModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getRunesCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kRunesPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RuneModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kSumAbilityPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getHeroBestGroupCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kBestGroupPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
@end

