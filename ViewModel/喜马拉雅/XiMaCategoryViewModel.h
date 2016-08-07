//
//  XiMaCategoryViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import"XiMaNetManager.h"
@interface XiMaCategoryViewModel : BaseViewModel
@property(nonatomic)NSInteger pageId;
-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)introForRow:(NSInteger)row;
-(NSString*)tracksForRow:(NSInteger)row;
-(NSURL*)albumCoverURLForRow:(NSInteger)row;
-(NSInteger)rowNum;
-(NSInteger)albumIdForRow:(NSInteger)row;
@end
