//
//  HFTextView.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFTextView.h"

@implementation HFTextView
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
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark setupView
-(void)setupView
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNeedsDisplay) name:UITextViewTextDidChangeNotification object:nil];
    self.placeholderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    self.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if(self.font == nil){
        self.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    if([self.text length] == 0 && self.placeholder && self.font) {
        CGRect placeHolderRect = CGRectMake(10.0f,
                                            7.0f,
                                            rect.size.width-14,
                                            rect.size.height);
        
        [self.placeholderColor set];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = self.textAlignment;
        
        [self.placeholder drawInRect:placeHolderRect
                      withAttributes:@{ NSFontAttributeName : self.font,
                                        NSForegroundColorAttributeName :  self.placeholderColor,
                                        NSParagraphStyleAttributeName : paragraphStyle}];
        
    }
}




@end
