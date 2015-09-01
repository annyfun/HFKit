//
//  HFTableCellObj.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/18.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFTableCellObj.h"

@implementation HFTableCellObj
-(id)init
{
    self = [super init];
    if(self){
        [self setupDefauleValues];
    }
    return self;
}

-(void)setupDefauleValues
{
    self.accessoryType         = UITableViewCellAccessoryNone;
    self.selectionStyle        = UITableViewCellSelectionStyleDefault;
    self.tablViewCellClassName = @"UITableViewCell";
    _cellIdentifier            = self.tablViewCellClassName;
    self.isStaticObj           = NO;
    self.cellHeigth            = 40;
}


- (BOOL)isFirstResponder
{
    return NO;
}

@end
