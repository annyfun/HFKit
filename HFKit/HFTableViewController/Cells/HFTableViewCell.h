//
//  HFTableViewCell.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/18.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFTableCellObj.h"
@interface HFTableViewCell : UITableViewCell
@property (nonatomic,readonly) HFTableCellObj*cellObj;


//重载该函数来设置你的UI
-(void)setupView;

-(void)bindData:(HFTableCellObj *)cellObj;

@end
