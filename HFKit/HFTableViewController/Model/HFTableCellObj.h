//
//  HFTableCellObj.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/18.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HFTableCellObj : NSObject


@property (nonatomic,assign)   UITableViewCellSelectionStyle   selectionStyle;
@property (nonatomic,assign)   UITableViewCellAccessoryType    accessoryType;


@property (nonatomic,strong) NSString *tablViewCellClassName;
@property (nonatomic,readonly) NSString *cellIdentifier;   //当isStaticObj 为NO 时。默认为tablViewCellClassName。当isStaticObj为YES..默认会生成一个唯一的


//cell响应事件，快捷设置cell 的响应   重载tableVie的cell选中来实现自己的响应事件
@property (nonatomic,assign) SEL cellAction;
@property (nonatomic,assign) Class pushToClass;  //点击直接push 到viewcontroller  如果需要传递参数。使用cellAction


//静态的obj。。对应的cell不会被重载  defalut 为NO
@property (nonatomic,assign) BOOL isStaticObj;
@property (nonatomic,assign) float cellHeigth;  //行高 默认40

//cell 的数据
@property (nonatomic,strong) id valueData;

//设置初始默认值
-(void)setupDefauleValues;


//子类重载判断 subView 的输入控件是否是输入状态。用户键盘弹起时，tableView的滚动  默认NO
- (BOOL)isFirstResponder;
@end
