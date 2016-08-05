//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by davidroman on 16/8/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UILabel *)clickNumberLb {
    if(_clickNumberLb == nil) {
        _clickNumberLb = [[UILabel alloc] init];
        _clickNumberLb.font = [UIFont systemFontOfSize:12];
        _clickNumberLb.textColor=[UIColor lightGrayColor];
        _clickNumberLb.textAlignment = NSTextAlignmentRight;
    }
    return _clickNumberLb;
}

- (TRImageView *)iconIV0 {
    if(_iconIV0 == nil) {
        _iconIV0 = [[TRImageView alloc] init];
        
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[TRImageView alloc] init];
       
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[TRImageView alloc] init];
     
    }
    return _iconIV2;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clickNumberLb];
         [self.contentView addSubview:self.iconIV0];
         [self.contentView addSubview:self.iconIV1];
         [self.contentView addSubview:self.iconIV2];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(self.clickNumberLb.mas_left).mas_equalTo(-10);
        }];
        [self.clickNumberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
            
        }];
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
        
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV0);
            make.left.mas_equalTo(self.iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.iconIV0);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconIV0);
            make.topMargin.mas_equalTo(self.iconIV0);
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            
        }];
        
    }
    return self;
}
@end
