//
//  Cellforimage.h
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cellforimage : UITableViewCell

@property (nonatomic, retain)UIImageView *imageViewForPic;

+ (CGFloat)heightForCellWithName:(NSString *)name;

@end
