//
//  Cellforimage.m
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import "Cellforimage.h"

@implementation Cellforimage

- (void)dealloc{
    [_imageViewForPic release];
    [super dealloc];

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubView];
        
    }
    
    
    return self;
    
}

    
- (void)createSubView{

    self.imageViewForPic = [[UIImageView alloc]init];
    
    [self.contentView addSubview:self.imageViewForPic];
    
    [_imageViewForPic release];
}
    
    
/** 布局视图大小 */

- (void)layoutSubviews{


    [super layoutSubviews];
    
    self.imageViewForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightForImage:self.imageViewForPic.image]);


}


/**计算 图片的自适应高度 类方法, 上面布局视图 高度调用*/


+(CGFloat)heightForImage:(UIImage *)image{
    return image.size.height / image.size.width * ([UIScreen mainScreen].bounds.size.width - 20);
}



/** 计算高度 算法*/

+ (CGFloat)heightForCellWithName:(NSString *)name{

    UIImage *image = [UIImage imageNamed:name];
    
    return image.size.height / image.size.width * ([UIScreen mainScreen].bounds.size.width - 20) + 20;

}












- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
