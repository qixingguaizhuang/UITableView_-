//
//  CellOfNews.h
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModenOfNew;

@interface CellOfNews : UITableViewCell

- (void)passModel:(ModenOfNew *) model;
+ (CGFloat)heightForCell:(ModenOfNew *)model;

@end
