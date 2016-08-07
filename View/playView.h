//
//  playView.h
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface playView : UIView
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)UIButton *playBtn;
+(id)shareInstance;
-(void)playWithURL:(NSURL*)url;

@end
