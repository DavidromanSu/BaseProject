//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by davidroman on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
#import "TuWanPicModel.h"
@interface TuWanPicViewModel : BaseViewModel
-(id)initWithAid:(NSString*)aid;
@property(strong,nonatomic)NSString *aid;
@property(nonatomic)NSInteger rowNumber;
-(NSURL*)picURLForRow:(NSInteger)row;

@end
