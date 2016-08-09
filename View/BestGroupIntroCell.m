//
//  BestGroupIntroCell.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#define kSpace (kWindowW - 52*5)/6
#import "BestGroupIntroCell.h"

@implementation BestGroupIntroCell


- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UIImageView *)icon1 {
    if(_icon1 == nil) {
        _icon1 = [[UIImageView alloc] init];
    }
    return _icon1;
}

- (UIImageView *)icon2 {
    if(_icon2 == nil) {
        _icon2 = [[UIImageView alloc] init];
    }
    return _icon2;
}

- (UIImageView *)icon3 {
    if(_icon3 == nil) {
        _icon3 = [[UIImageView alloc] init];
    }
    return _icon3;
}

- (UIImageView *)icon4 {
    if(_icon4 == nil) {
        _icon4 = [[UIImageView alloc] init];
    }
    return _icon4;
}

- (UIImageView *)icon5 {
    if(_icon5 == nil) {
        _icon5 = [[UIImageView alloc] init];
    }
    return _icon5;
}

- (UILabel *)desLb {
    if(_desLb == nil) {
        _desLb = [[UILabel alloc] init];
        _desLb.font=[UIFont systemFontOfSize:15];
        _desLb.numberOfLines = 0;
    }
    return _desLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.titleLb];
        [self addSubview:self.icon1];
        [self addSubview:self.icon2];
        [self addSubview:self.icon3];
        [self addSubview:self.icon4];
        [self addSubview:self.icon5];
        [self addSubview:self.desLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
        }];
        [self.icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(52, 52));
            make.left.mas_equalTo(kSpace);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
        }];
        [self.icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.icon1);
            make.left.mas_equalTo(self.icon1.mas_right).mas_equalTo(kSpace);
            make.topMargin.mas_equalTo(self.icon1.mas_topMargin);
        }];
        [self.icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.icon1);
            make.left.mas_equalTo(self.icon2.mas_right).mas_equalTo(kSpace);
            make.topMargin.mas_equalTo(self.icon1.mas_topMargin);
        }];
        [self.icon4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.icon1);
            make.left.mas_equalTo(self.icon3.mas_right).mas_equalTo(kSpace);
            make.topMargin.mas_equalTo(self.icon1.mas_topMargin);
        }];
        [self.icon5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.icon1);
            make.left.mas_equalTo(self.icon4.mas_right).mas_equalTo(kSpace);
            make.topMargin.mas_equalTo(self.icon1.mas_topMargin);
        }];
        [self.desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.icon1.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
