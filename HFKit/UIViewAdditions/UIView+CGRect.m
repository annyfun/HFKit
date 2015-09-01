//
//  UIView+CGRect.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "UIView+CGRect.h"

@implementation UIView (CGRect)

-(CGPoint)frameOrigin
{
    return self.frame.origin;
}
- (void)setFrameOrigin:(CGPoint)frameOrigin {

    CGRect frame = self.frame;
    frame.origin = frameOrigin;
    self.frame   = frame;
}

-(CGSize)frameSize
{
   return self.frame.size;
}
-(void)setFrameSize:(CGSize)frameSize
{
    CGRect frame = self.frame;
    frame.size   = frameSize;
    self.frame   = frame;
}

-(CGFloat)originX
{
    return self.frameOrigin.x;
}
-(void)setOriginX:(CGFloat)originX
{
    CGRect frame   = self.frame;
    CGPoint origin = frame.origin;
    origin.x       = originX;
    frame.origin   = origin;
    self.frame     = frame;
}

-(CGFloat)originY
{
    return self.frameOrigin.y;
}
-(void)setOriginY:(CGFloat)originY
{
    CGRect frame   = self.frame;
    CGPoint origin = frame.origin;
    origin.y       = originY;
    frame.origin   = origin;
    self.frame     = frame;
}

-(CGFloat)sizeWidth
{
     return self.frameSize.width;
}
-(void)setSizeWidth:(CGFloat)sizeWidth
{
    CGRect frame = self.frame;
    CGSize size  = frame.size;
    size.width   = sizeWidth;
    frame.size   = size;
    self.frame   = frame;
}


-(CGFloat)sizeHeight
{
    return self.frameSize.height;
}
-(void)setSizeHeight:(CGFloat)sizeHeight
{
    CGRect frame = self.frame;
    CGSize size  = frame.size;
    size.height  = sizeHeight;
    frame.size   = size;
    self.frame   = frame;
}
@end
