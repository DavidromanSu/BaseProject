//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
@interface TuWanViewModel : BaseViewModel
@property (nonatomic)NSInteger start;
@property (nonatomic)NSInteger rowNumber;
@property (nonatomic ,strong)NSArray *indexPicArr;
@property (nonatomic ,getter=isExistIndexPic)BOOL existIndexPic;
@property (nonatomic)InfoType type;
-(instancetype)initWithType:(InfoType)type;
-(bool)containImages:(NSInteger)row;
-(NSString*)titleForRowInList:(NSInteger)row;
-(NSURL*)iconURLForRowInList:(NSInteger)row;
-(NSString*)descForRowInList:(NSInteger)row;
-(NSString*)clickForRowInList:(NSInteger)row;
-(NSURL*)iconURLForRowInIndexPic:(NSInteger)row;
-(NSString*)titleForRowInIndexPic:(NSInteger)row;
@property(nonatomic)NSInteger indexPicNumber;
-(NSURL*)detailURLForRowInList:(NSInteger)row;
-(NSURL*)detailURLForRowInIndexPic:(NSInteger)row;
@end
