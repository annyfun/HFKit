//
//  UICustomTableViewCell.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "UICustomTableViewCell.h"

@implementation UICustomTableViewCell



#pragma mark 重载函数
-(void)setupView
{
}

-(void)bindData:(HFCustomTableCellObj *)cellObj
{
    [super bindData:cellObj];
}

#pragma mark 计算自定义cell的高度
+(CGFloat)cellHeigthForData:(HFCustomTableCellObj *)cellObj
{
    if(cellObj.cellHeigth == 0)
    {
        //计算cell 的高度
    
        cellObj.cellHeigth = 40;
    }
    return cellObj.cellHeigth;

}
@end
