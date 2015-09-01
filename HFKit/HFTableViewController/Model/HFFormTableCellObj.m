//
//  HFFormTableCellObj.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/19.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFFormTableCellObj.h"
#import "HFButton.h"
#import "HFTextView.h"
#import "HFTextField.h"
@implementation HFFormTableCellObj
@synthesize cellIdentifier = _cellIdentifier;
@synthesize valueData = _valueData;

-(id)initWithAccessoryMode:(HFFormAccessoryMode)mode
{
    self = [super init];
    if(self)
    {
        [self setAccessoryMode:mode];
    }
    return self;
}
-(void)setupDefauleValues
{
    [super setupDefauleValues];
    self.accessoryMode         = HFFormAccessoryModeNone;
    self.isRequired            = NO;
    self.isStaticObj           = YES;
    self.tablViewCellClassName = @"HFFormTableViewCell";
    self.leftPadding           = 15;
    self.rigthPadding          = 15;
    self.topPadding            = -1;
    self.titleHeight           = 30;
    _cellIdentifier            = [self creatNewIdentifier];
}


#pragma mark setter
-(void)setAccessoryMode:(HFFormAccessoryMode)accessoryMode
{
    _accessoryMode = accessoryMode;
    switch (_accessoryMode) {
        case HFFormAccessoryModeNone: {
            _accessoryView = nil;
            break;
        }
        case HFFormAccessoryModeLabel: {
            
            UILabel *label = [UILabel new];
            label.backgroundColor = [UIColor clearColor];
            label.textAlignment = NSTextAlignmentRight;
            _accessoryView = label;
            
            break;
        }
        case HFFormAccessoryModeTextField: {
            HFTextField *textField = [HFTextField new];
            textField.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
            textField.backgroundColor = [UIColor clearColor];
            textField.placeholderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
            _accessoryView = textField;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
        case HFFormAccessoryModeTextView: {
            HFTextView *textView = [HFTextView new];
            textView.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
            textView.backgroundColor = [UIColor clearColor];
            _accessoryView = textView;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
        }
        case HFFormAccessoryModeButton: {
        
            _accessoryView = [HFButton new];
            _accessoryView.backgroundColor = [UIColor clearColor];
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
        }
        case HFFormAccessoryModeSwitch: {
          
            UISwitch *switchView = [UISwitch new];
            switchView.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
            _accessoryView =switchView;
            
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
        case HFFormAccessoryModeCustom: {
            
            break;
        }
        case HFFormAccessoryModeLine: {
            
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
            _accessoryView =lineView;

            self.cellHeigth=1;
            break;
        }
        default: {
            break;
        }
    }
}

-(void)setCustomAccessoryView:(UIView *)accessoryView
{
    if(_accessoryMode == HFFormAccessoryModeCustom)
    {
        _accessoryView  = accessoryView;
    }
    
}
#pragma mark setter
-(void)setPlaceholder:(NSString *)placeholder
{
    
    _placeholder = placeholder;
    switch (self.accessoryMode) {
     
        case HFFormAccessoryModeTextField: {
            HFTextField *textField =(HFTextField *)self.accessoryView;
            textField.placeholder = placeholder;
            break;
        }
        case HFFormAccessoryModeTextView: {
             HFTextView *textView =(HFTextView *)self.accessoryView;
            textView.placeholder = placeholder;
            break;
        }
     
        default: {
            break;
        }
    }
}

-(void)setValueData:(id)valueData
{
    _valueData = valueData;
    switch (self.accessoryMode) {
        case HFFormAccessoryModeNone: {
            
            break;
        }
        case HFFormAccessoryModeLabel: {
            UILabel *label =(UILabel *)self.accessoryView;
            label.text = [NSString stringWithFormat:@"%@",valueData];
//            if(label.text.length == 0)
//            {
//                label.text =self.placeholder;
//            }
            break;
        }
        case HFFormAccessoryModeTextField: {
            HFTextField *textField = (HFTextField *)self.accessoryView;
            textField.text = [NSString stringWithFormat:@"%@",valueData];
            break;
        }
        case HFFormAccessoryModeTextView: {
            HFTextView *textView = (HFTextView *)self.accessoryView;
            textView.text = [NSString stringWithFormat:@"%@",valueData];
            break;
        }
        case HFFormAccessoryModeButton: {
            HFButton *button = (HFButton *)self.accessoryView;
            [button setTitle:[NSString stringWithFormat:@"%@",valueData] forState:UIControlStateNormal];
            break;
        }
        case HFFormAccessoryModeSwitch: {
            UISwitch *switchView = (UISwitch *)self.accessoryView;
            switchView.on =[valueData boolValue];
            break;
        }
        case HFFormAccessoryModeCustom: {
            
            break;
        }
        case HFFormAccessoryModeLine: {
            
            break;
        }
        default: {
            break;
        }
    }
}

#pragma mark getter
-(id)valueData
{
    
    switch (self.accessoryMode) {
        case HFFormAccessoryModeNone: {
           return _valueData;
            break;
        }
        case HFFormAccessoryModeLabel: {
            return _valueData;
            break;
        }
        case HFFormAccessoryModeTextField: {
            HFTextField *inputView = (HFTextField *)self.accessoryView;
            NSString *value =inputView.text;
            return value;
            break;
        }
        case HFFormAccessoryModeTextView: {
            return _valueData;
            break;
        }
        case HFFormAccessoryModeButton: {
            return _valueData;
            break;
        }
        case HFFormAccessoryModeSwitch: {
            UISwitch *switchView = (UISwitch *)self.accessoryView;
            return [NSString stringWithFormat:@"%i",switchView.on];
            break;
        }
        case HFFormAccessoryModeCustom: {
            return _valueData;
            break;
        }
        case HFFormAccessoryModeLine: {
            return _valueData;
            break;
        }
        default: {
            return _valueData;
            break;
        }
    }
    return _valueData;
}
-(NSString *)formValueStr
{
    
    NSString *valueStr = [NSString stringWithFormat:@"%@",self.valueData];;
    switch (self.accessoryMode) {
        case HFFormAccessoryModeNone: {
            break;
        }
        case HFFormAccessoryModeLabel: {
            break;
        }
        case HFFormAccessoryModeTextField: {
            HFTextField *inputView = (HFTextField *)self.accessoryView;
            valueStr =inputView.text;
        
            break;
        }
        case HFFormAccessoryModeTextView: {
            HFTextView *inputView = (HFTextView *)self.accessoryView;
            valueStr =inputView.text;
            
            break;
        }
        case HFFormAccessoryModeButton: {
        
            break;
        }
        case HFFormAccessoryModeSwitch: {
            UISwitch *switchView = (UISwitch *)self.accessoryView;
            valueStr = [NSString stringWithFormat:@"%i",switchView.on];
            break;
        }
        case HFFormAccessoryModeCustom: {
            break;
        }
        case HFFormAccessoryModeLine: {
       
            break;
        }
        default: {
    
            break;
        }
    }
    return valueStr;
}
#pragma mark action

//创建一个惟一标示
-(NSString *)creatNewIdentifier
{
    
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;

}

-(BOOL)isFirstResponder
{
    return self.accessoryView.isFirstResponder;
}


//如果返回nil。 表示value符合要求。否则返回错误的信息
-(NSString *)checkValueError
{
    NSString *errorStr = nil;
    NSString *formValueStr = [self formValueStr];
    
    if(self.isRequired)
    {
        if(self.accessoryMode == HFFormAccessoryModeTextView || self.accessoryMode == HFFormAccessoryModeTextField)
        {
            if(formValueStr==nil || formValueStr.length<1)
            {
                errorStr = [NSString stringWithFormat:@"请输入%@",self.objName];
            }
            else
            {
                if(self.regex)
                {
                    NSPredicate *regexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex];
                    if(![regexPredicate evaluateWithObject:self.formValueStr])
                    {
                        errorStr = [NSString stringWithFormat:@"请输入正确的%@",self.objName];
                    }
                }
            }
        }
        else {
            if(formValueStr==nil || formValueStr.length<1)
            {
                errorStr = [NSString stringWithFormat:@"请选择%@",self.objName];
            }
            
        }
    }
    else
    {
        if(self.regex && formValueStr != nil && formValueStr.length >0)
        {
            NSPredicate *regexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex];
            if(![regexPredicate evaluateWithObject:formValueStr])
            {
                errorStr = [NSString stringWithFormat:@"请输入正确的%@",self.objName];
            }
        }
    }
    
    return errorStr;
}


@end
