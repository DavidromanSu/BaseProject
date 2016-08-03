//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#define kTuWanPath  @"http://cache.tuwan.com/app/"
#define kAppId      @"appid": @1
#define kAppVer     @"appver": @2.1
#define kClassMore  @"classmore": @"indexpic"

#define kRemoveClassMore(dic)        [dic removeObjectForKey:@"classmore"];
#define kSetDtId(string, dic)        [dic setObject:string forKey:@"dtid"];
#define kSetClass(string, dic)       [dic setObject:string forKey:@"class"];
#define kSetMod(string, dic)         [dic setObject:string forKey:@"mod"];
@implementation TuWanNetManager
+(id)getTuWanInfoWithType:(InfoType)type start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kAppId,kAppVer,kClassMore,@"start":@(start)}];
    switch (type) {
        case InfoTypeTouTiao: {
            break;
        }
        case InfoTypeDuJia: {
            kRemoveClassMore(params)
            kSetMod(@"八卦", params)
            kSetClass(@"heronews", params)
            break;
        }
        case InfoTypeAnHei3: {
            kSetDtId(@"83623", params)
            break;
        }
        case InfoTypeMoShou: {
            kSetDtId(@"31537", params)
            break;
        }
        case InfoTypeFengBao: {
            kSetDtId(@"31538", params)
            break;
        }
        case InfoTypeLuShi: {
            kSetDtId(@"31528", params)
            break;
        }
        case InfoTypeXingJi2: {
            kRemoveClassMore(params)
            kSetDtId(@"91821", params)
            break;
        }
        case InfoTypeShouWang: {
            kRemoveClassMore(params)
            kSetDtId(@"57067", params)
            break;
        }
        case InfoTypeTuPian://图片,视频,攻略 参数只差type，所以去掉case的break
        case InfoTypeShiPin:
        case InfoTypeGongLue: {
            if (type == InfoTypeTuPian) [params setObject:@"pic" forKey:@"type"];
            if (type == InfoTypeShiPin) [params setObject:@"video" forKey:@"type"];
            if (type == InfoTypeGongLue) [params setObject:@"guide" forKey:@"type"];
            kSetDtId(@"83623,31528,31537,31538,57067,91821", params)
            kRemoveClassMore(params)
            break;
        }
        case InfoTypeHuanHua: {
            kRemoveClassMore(params)
            kSetClass(@"heronews", params)
            kSetMod(@"幻化", params)
            break;
        }
        case InfoTypeQuWen: {
            kSetMod(@"趣闻", params)
            kSetClass(@"heronews", params)
            kSetDtId(@"0", params);
            break;
        }
        case InfoTypeCos: {
            kSetClass(@"cos", params)
            kSetDtId(@"0", params)
            kSetMod(@"cos", params)
            break;
        }
        case InfoTypeMeiNv: {
            kSetMod(@"美女", params)
            kSetClass(@"heronews", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        }
        default: {
            NSAssert1(NO, @"%s:type类型不正确", __func__);
            break;
        }
    }
    NSString *path =[self percentPathWithPath:kTuWanPath params:params];
return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
    completionHandle([TuWanModel objectWithKeyValues:responseObj],error);} ];
}

@end
