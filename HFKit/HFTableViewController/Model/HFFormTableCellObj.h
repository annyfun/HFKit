//
//  HFFormTableCellObj.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFTableCellObj.h"

typedef NS_ENUM(NSInteger,HFFormAccessoryMode) {
    HFFormAccessoryModeNone=0,   //没有Accessory
    HFFormAccessoryModeLabel,
    HFFormAccessoryModeTextField ,
    HFFormAccessoryModeTextView,
    HFFormAccessoryModeButton,
    HFFormAccessoryModeSwitch,

    HFFormAccessoryModeCustom,    //自定义Accessory
    
//Line cell整体作为线 没有title & imageView 不接受事件。行高默认1;
    HFFormAccessoryModeLine,
};

@interface HFFormTableCellObj : HFTableCellObj
@property (nonatomic,readonly) HFFormAccessoryMode accessoryMode;

@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) NSInteger titleHeight;  //默认30

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,assign) CGSize imageSize; //if size{0,0} &headImage!= nil; size{cellHeigth-10,cellHeigth-10}

@property (nonatomic,assign) NSInteger rigthPadding;    //右边边距 默认15
@property (nonatomic,assign) NSInteger leftPadding;     //左边边距 默认15

@property (nonatomic,assign) NSInteger topPadding;      //  默认－1，不生效，相对cell （image、title、accessoryView）居中


@property (nonatomic,readonly)  UIView *accessoryView;
@property (nonatomic,assign)    CGSize accessoryViewSize;

//for 数据提交
@property (nonatomic,assign) BOOL isRequired;       //必填项 不设置regex 只判断不能为空 默认NO
@property (nonatomic,strong) NSString *objName;
@property (nonatomic,strong) NSString *objKey;
@property (nonatomic,strong) NSString *regex;       //判断值正则。。


//      HFFormAccessoryModeTextField ,
//      HFFormAccessoryModeTextView,
//      HFFormAccessoryModeLabel 情况下有效
@property (nonatomic, copy) NSString *placeholder;


-(id)initWithAccessoryMode:(HFFormAccessoryMode)mode;


//仅在HFFormAccessoryModeCustom 设置有效
-(void)setCustomAccessoryView:(UIView *)accessoryView;



//如果返回nil。 表示value符合要求。否则返回错误的信息
-(NSString *)checkValueError;

@end
