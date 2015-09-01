//
//  HFLabel.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/26.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, HFLabelVerticalAligment)
{
    HFLabelVerticalAligmentCenter =0,  //默认
    
    HFLabelVerticalAligmentTop ,
    HFLabelVerticalAligmentBottom,
    
};

@interface HFLabel : UILabel
@property (nonatomic,assign) HFLabelVerticalAligment verticalAligment;
@end
