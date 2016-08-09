//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface BestGroupViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNum;
-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)descForRow:(NSInteger)row;
-(NSArray*)descsForRow:(NSInteger)row;
-(NSArray*)heroIconsForRow:(NSInteger)row;

@end
