//
//  ZBDetailViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

#import "DuoWanNetManager.h"
@interface ZBDetailViewModel : BaseViewModel
- (id)initWithTag:(NSString *)tag;
@property(nonatomic,strong) NSString *tag;
@property(nonatomic) NSInteger rowNumber;
- (NSString *)itemNameForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSInteger)itemIdForRow:(NSInteger)row;


@end
