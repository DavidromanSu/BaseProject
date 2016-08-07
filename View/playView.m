//
//  playView.m
//  BaseProject
//
//  Created by davidroman on 16/8/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "playView.h"

@implementation playView
+(id)shareInstance{
    static playView *playview=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playview = [[playView alloc]init];
    });
    return playview;
}
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn=[UIButton new];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        [_playBtn bk_addEventHandler:^(id sender) {
            if (_playBtn.selected) {
                [self.player pause];
                
            }else{
                [self.player play];
            }
            [_playBtn setSelected:!_playBtn.selected];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
-(void)playWithURL:(NSURL *)url{
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    self.player=[AVPlayer playerWithURL:url];
    [self.player play];
    self.playBtn.selected =YES;
}
@end
