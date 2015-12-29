//
//  CellOfNews.m
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import "CellOfNews.h"

/** 导入 model 给控件赋值 NO.6*/

#import "ModenOfNew.h"



#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface CellOfNews ()

@property (nonatomic, retain)UILabel *labelOfTitle;
@property (nonatomic, retain)UILabel *labelOfSummary;

@end


@implementation CellOfNews


- (void)dealloc{
    [_labelOfTitle release];
    [_labelOfSummary release];
    [super dealloc];
}

/**自定义 cell  重写初始化方法 N0.4 */

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }

    return self;

}

/** 将自定义 子控件放到 contentView */

- (void)createSubView{
    
      self.labelOfTitle = [[UILabel alloc] init];
    self.labelOfSummary = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.labelOfTitle];
    [self.contentView addSubview:self.labelOfSummary];
    
    [_labelOfSummary release];
    [_labelOfTitle release];

}



/** 布局视图 N0.10*/

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.labelOfTitle.frame = CGRectMake(10, 10, WIDTH - 20, 50);
    self.labelOfSummary.frame = CGRectMake(10, 10 + 50 + 50, WIDTH - 20, [[self class] heightForLable:self.labelOfSummary.text]);
    
    self.labelOfSummary.numberOfLines = 0;
    self.labelOfTitle.numberOfLines = 0;
}


/** 返回每行的高度 调用这里计算高度的方法 --->>> vc 中调用, 在 lable 中输入后返回的 lable 的实际高度*/


/*** lable 大小 布局视图中调用, lable summary 中高度也要自适应所以也需要计算高度  NO.09 */

+ (CGFloat)heightForLable: (NSString *)text{

    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:1 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.height;

}


/** 自适应 高度 cell */

+ (CGFloat)heightForCell:(ModenOfNew *)model{

/** summary 自适应,返回的是 cell 主屏幕矩形的宽, 高预估值无限大 为 0 ,summary 自适应,返回实际 height  option 是花视图的样式; attributes 字体大小 */
    
    CGRect rect = [model.summary boundingRectWithSize:CGSizeMake(WIDTH, 0) options:1 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];

    return 10 + 25 + 40 + rect.size.height + 60;

}




/** cell 赋值调用传值的方法 NO.6*/

- (void)passModel:(ModenOfNew *) model{

      self.labelOfTitle.text = model.title;
    self.labelOfSummary.text = model.summary;

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
