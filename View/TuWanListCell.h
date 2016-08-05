//
//  TuWanListCell.h
//  BaseProject
//
//  Created by davidroman on 16/8/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanListCell : UITableViewCell
@property(strong,nonatomic)TRImageView *iconIV;
@property(strong,nonatomic)UILabel *titleLB;
@property(strong,nonatomic)UILabel *longTitleLB;
@property(strong,nonatomic)UILabel *clickNumLB;
@end
