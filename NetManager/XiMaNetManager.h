//
//  xiMaNetManager.h
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ximalaya.h"
@interface XiMaNetManager : BaseNetManager
+ (id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;

/**
 *  根据音乐组类型ID获取对应音乐列表。 两个参数的确定完全是靠经验,工作以后会有服务器人员告诉你哪些是参数,应该传什么!
 *
 *  @param ID     音乐组ID
 *  @param pageId 当前页数，从1开始 eg 1,2,3,4,5...
 *
 *  @return 返回当前请求所在任务
 */
+ (id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId kCompletionHandle;
@end
