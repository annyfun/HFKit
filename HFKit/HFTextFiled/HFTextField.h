//
//  HFTextField.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFTextField : UITextField
@property(nonatomic,assign) CGFloat textOffset;  //默认5

@property (nonatomic, copy) UIColor *placeholderColor; //默认0.5的灰色

@end
