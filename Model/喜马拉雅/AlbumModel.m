//
//  AlbumModel.m
//  BaseProject
//
//  Created by davidroman on 16/8/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end
@implementation AlbumAlbumModel

@end


@implementation AlbumTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AlbumTracksListModel class]};
}

@end


@implementation AlbumTracksListModel

@end


