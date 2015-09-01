//
//  HFTableViewController.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/18.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFTableCellObj.h"
#import "HFTableCellObj.h"
#import "HFTableViewCell.h"
#import "HFFormTableCellObj.h"
#import "HFCustomTableCellObj.h"
#import "UICustomTableViewCell.h"

/**
 *  tableViewController 的基类。。
 */
@interface HFBaseTableViewController : UIViewController

@property(nonatomic,strong)  UITableView *tableView;
@property(nonatomic,strong)  NSMutableArray *cellObjs;



/**
 *  重载来自定table样式和位置
 */
-(void)setupTableView;

/**
 *  设置数据 切勿直接调用。。。需要刷新调用reloadData
 */
-(void)setupData;


/**
 *  调用该函数会触发setupData 重新设置数据
 */
-(void)reloadData;
/**
 *  重载 用于自定义 cell 或者修改cell样式
 *
 *  @param sender    tablbve
 *  @param indexPath indexPath
 *
 *  @return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)sender cellForRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 *  子类重载用于自己处理一些事件
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  通过key获取到对应的cellObj
 *
 *  @param key key
 *
 *  @return 找到的cellObj。未找到为nil
 */
-(HFTableCellObj *)cellObjForObjKey:(NSString *)key;

-(HFTableCellObj *)cellObjForIndexPath:(NSIndexPath *)indexpah;


@end
