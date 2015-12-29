//
//  ModenOfNew.m
//  UITableView_自适应
//
//  Created by sp on 15/12/29.
//  Copyright © 2015年 sp. All rights reserved.
//

#import "ModenOfNew.h"

@implementation ModenOfNew

/** 防止setValue 方法在 cell 中调用时, 有未识别的 key 发生报错,所以写上这句话 一个方法*/

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
