//
//  UIView+CGRect.h
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CGRect)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat originX;
@property (nonatomic) CGFloat originY;

@property (nonatomic) CGFloat sizeWidth;
@property (nonatomic) CGFloat sizeHeight;
@end
