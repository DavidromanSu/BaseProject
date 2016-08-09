//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBCategoryViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNum;
-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)tagForRow:(NSInteger)row;
@end
