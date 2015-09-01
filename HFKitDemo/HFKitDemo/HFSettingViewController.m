//
//  HFSettingViewController.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/26.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFSettingViewController.h"

@implementation HFSettingViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
}

-(void)setupData
{
    [super setupData];
    
    NSMutableArray *array = [NSMutableArray array];
    HFFormTableCellObj *cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeCustom];
    cellObj.title = @"用户信息";
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"settingIcon"];
        
        [cellObj setCustomAccessoryView:imageView];
        cellObj.accessoryViewSize = CGSizeMake(50, 50);
        cellObj.rigthPadding=5;
    }
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellObj.cellAction = @selector(modifyUserInfo:);
    cellObj.cellHeigth = 60;
    [array addObject:cellObj];
    
    [self.cellObjs addObject:array];
    
    
    array = [NSMutableArray array];
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.title = @"我的收藏";
    cellObj.valueData = @"11";
    cellObj.image = [UIImage imageNamed:@"settingIcon"];
    cellObj.cellAction = @selector(cellObjAction:);
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cellObj.rigthPadding=30;
    [array addObject:cellObj];
   
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.title = @"我的订单";
    cellObj.valueData = @"12";
    cellObj.image = [UIImage imageNamed:@"settingIcon"];
    cellObj.cellAction = @selector(cellObjAction:);
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cellObj.rigthPadding=30;
    [array addObject:cellObj];
   
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.title = @"我的作品";
    cellObj.valueData = @"13";
    cellObj.image = [UIImage imageNamed:@"settingIcon"];
    cellObj.cellAction = @selector(cellObjAction:);
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     cellObj.rigthPadding=30;
    [array addObject:cellObj];
    
    [self.cellObjs addObject:array];
}



#pragma mark -- event respone 
-(void)modifyUserInfo:(HFFormTableCellObj *)cellObj
{
    NSLog(@"modifyUserInfo");
}


-(void)cellObjAction:(HFFormTableCellObj *)cellObj
{
    NSLog(@"%@",cellObj.title);
}
@end
