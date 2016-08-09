//
//  BestGroupDetailCell.m
//  BaseProject
//
//  Created by davidroman on 16/8/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupDetailCell.h"

@implementation BestGroupDetailCell
- (UIImageView *)icon {
    if(_icon == nil) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
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
        [self addSubview:self.icon];
        [self addSubview:self.desLb];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(52, 52));
            
        }];
        [self.desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
            
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
