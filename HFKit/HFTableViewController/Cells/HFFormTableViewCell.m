//
//  HFFormTableViewCell.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFFormTableViewCell.h"
#import <Masonry.h>
@implementation HFFormTableViewCell
{
        UIView *accessoryView;
}


#pragma mark 重载函数
-(void)setupView
{
    _titleLabel = [UILabel new];
    self.titleLabel.font =[UIFont systemFontOfSize:16];
    [self.contentView  addSubview:self.titleLabel];
    
    _iconView = [UIImageView new];

    [self.contentView addSubview:self.iconView];
    
}

-(void)bindData:(HFFormTableCellObj *)cellObj
{
    [super bindData:cellObj];
    
    if(accessoryView&& (accessoryView.superview==self || accessoryView.superview.superview==self))
    {
        [accessoryView removeFromSuperview];
        accessoryView=nil;
    }
    self.titleLabel.text = cellObj.title;
    self.iconView.image = cellObj.image;
    
    self.accessoryType = cellObj.accessoryType;
    self.selectionStyle = cellObj.selectionStyle;
    
    
    if(cellObj.image)
    {
           self.iconView.hidden = NO;
        CGSize imageSize;
        if(CGSizeEqualToSize(cellObj.imageSize, CGSizeZero))
        {
            imageSize = CGSizeMake(cellObj.cellHeigth-10, cellObj.cellHeigth-10);
        }
        else{
            imageSize = cellObj.imageSize;
        }
        [self.iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(cellObj.leftPadding);
            make.width.equalTo(@(imageSize.width));
            make.height.equalTo(@(imageSize.height));
            if(cellObj.topPadding < 0)
            {
                make.centerY.equalTo(self.contentView);
            }
            else{
                make.top.equalTo(self.contentView).offset(cellObj.topPadding);
            }
        }];
    }
    else{
        self.iconView.hidden = YES;
    }
    
   
   if(cellObj.accessoryView)
   {
       accessoryView = cellObj.accessoryView;
       [self.contentView addSubview:accessoryView];
       if(!CGSizeEqualToSize(cellObj.accessoryViewSize, CGSizeZero))
       {
           [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
               if(cellObj.image)
               {
                   make.left.equalTo(self.iconView.mas_right).offset(cellObj.leftPadding);
               }
               else
               {
                   make.left.equalTo(self.contentView).offset(cellObj.leftPadding);
               }
               
               make.right.equalTo(self.contentView).offset(-(cellObj.rigthPadding*2+cellObj.accessoryViewSize.width));
               
               make.height.equalTo(@(cellObj.titleHeight));
               if(cellObj.topPadding <  0)
               {
                   make.centerY.equalTo(self.contentView);
               }
               else{
                   make.top.equalTo(self.contentView).offset(cellObj.topPadding);
                   
               }
           }];
           
           [accessoryView mas_remakeConstraints:^(MASConstraintMaker *make) {
              
               make.right.equalTo(self.contentView).offset(-cellObj.rigthPadding);
               make.width.equalTo(@(cellObj.accessoryViewSize.width));
               make.height.equalTo(@(cellObj.accessoryViewSize.height));
               if(cellObj.topPadding < 0)
               {
                   make.centerY.equalTo(self.contentView);
               }
               else{
                   make.top.equalTo(self.contentView).offset(cellObj.topPadding);
               }
              
           }];
       }
       else{
           
           [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
               if(cellObj.image)
               {
                   make.left.equalTo(self.iconView.mas_right).offset(cellObj.leftPadding);
               }
               else
               {
                   make.left.equalTo(self.contentView).offset(cellObj.leftPadding);
               }
               if(cellObj.title)
               {
                   make.right.equalTo(accessoryView.mas_left).offset(-cellObj.rigthPadding);
                   make.width.equalTo(accessoryView.mas_width);
               }
               make.height.equalTo(@(cellObj.titleHeight));
               if(cellObj.topPadding < 0)
               {
                   make.centerY.equalTo(self.contentView);
               }
               else{
                   make.top.equalTo(self.contentView).offset(cellObj.topPadding);
                   
               }
           }];
           
           [accessoryView mas_remakeConstraints:^(MASConstraintMaker *make) {
               
               if(cellObj.title)
               {
                   make.left.equalTo(self.titleLabel.mas_right).offset(cellObj.leftPadding);
                   make.width.equalTo(self.titleLabel.mas_width);
               }
               else{
                   if(cellObj.image)
                   {
                       make.left.equalTo(self.iconView.mas_right).offset(cellObj.leftPadding);
                   }
                   else
                   {
                       make.left.equalTo(self.contentView).offset(cellObj.leftPadding);
                   }
               }
               make.right.equalTo(self).offset(-cellObj.rigthPadding);
            
               if(cellObj.topPadding <  0)
               {
                   make.centerY.equalTo(self.contentView);
                   make.height.equalTo(@(cellObj.cellHeigth));
                   
               }
               else{
                   make.top.equalTo(@(cellObj.topPadding));
                   make.height.equalTo(self.contentView).offset(cellObj.cellHeigth - cellObj.topPadding*2);
               }
               
           }];
       }
   }
   else{

       [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
           if(cellObj.image)
           {
               make.left.equalTo(self.iconView.mas_right).offset(cellObj.leftPadding);
           }
           else
           {
               make.left.equalTo(self.contentView).offset(cellObj.leftPadding);
           }
           make.right.equalTo(self.contentView).offset(-cellObj.rigthPadding);
    
           make.height.equalTo(@(cellObj.titleHeight));
           if(cellObj.topPadding <  0)
           {
                make.centerY.equalTo(self.contentView);
           }
           else{
               make.top.equalTo(self.contentView).offset(cellObj.topPadding);
        
           }
       }];
       
   }

}

@end
