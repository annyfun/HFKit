//
//  HFLabel.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/26.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFLabel.h"

@implementation HFLabel



- (void)setVerticalAlignment:(HFLabelVerticalAligment)verticalAlignment {
    _verticalAligment = verticalAlignment;
    [self setNeedsDisplay];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAligment) {
            
        case HFLabelVerticalAligmentCenter: {
            
            break;
        }
        case HFLabelVerticalAligmentTop: {
            textRect.origin.y = bounds.origin.y;
            break;
        }
        case HFLabelVerticalAligmentBottom: {
              textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        }
        default: {
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;
        }
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end
