//
//  UICustomBaseTableViewCell.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFTableViewCell.h"
#import "HFCustomTableCellObj.h"
@interface UICustomTableViewCell : HFTableViewCell

+(CGFloat)cellHeigthForData:(HFCustomTableCellObj *)cellObj;
@end
