//
//  HFTextField.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFTextField.h"
#import "UIView+CGRect.h"
@implementation HFTextField
-(id)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}
#pragma mark setupView
-(void)setupView
{
    self.textOffset =5;
    self.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    self.placeholderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];

}

-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect rect= [super placeholderRectForBounds:bounds];
    return CGRectInset(rect, self.textOffset, 0);
    
}
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect rect= [super textRectForBounds:bounds];
    return CGRectInset(rect, self.textOffset, 0);
}
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect rect= [super editingRectForBounds:bounds];
    return CGRectInset(rect, self.textOffset, 0);
}

//-(void)setPlaceholderColor:(UIColor *)placeholderColor
//{
//    _placeholderColor = placeholderColor;
//    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//
//}

//
//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{

  
    
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
   paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes =@{ NSFontAttributeName : self.font,
                                 NSForegroundColorAttributeName :  self.placeholderColor,
                                 NSParagraphStyleAttributeName : paragraphStyle};
  
    //计算placeHolder 所绘位置   不知道为什么。这个地方的高度会比设置的少1
    CGSize szie = [self.placeholder sizeWithAttributes:attributes];
    rect.origin.y = (self.sizeHeight - szie.height)/2-1;

    [self.placeholderColor set];

    [self.placeholder drawInRect:rect
                  withAttributes:attributes];
    

}
@end
