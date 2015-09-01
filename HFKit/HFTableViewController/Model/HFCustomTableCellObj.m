//
//  HFCustomTableCellObj.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFCustomTableCellObj.h"

@implementation HFCustomTableCellObj

@synthesize cellIdentifier = _cellIdentifier;

-(void)setupDefauleValues
{
    [super setupDefauleValues];

    self.tablViewCellClassName = @"UITableViewCell";
    _cellIdentifier            = self.tablViewCellClassName;
    
}

@end
