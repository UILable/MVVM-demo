//
//  HomeTableViewCell.m
//  Test
//
//  Created by admin on 16/1/9.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HomeTableViewCell

-(void)setModel:(SongInfoModel *)model
{
    _titleLabel.text= model.title;
    _authorLabel.text=[NSString stringWithFormat:@"-%@",model.author];
    [_img sd_setImageWithURL:[NSURL URLWithString: model.pic_small] placeholderImage:nil];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
