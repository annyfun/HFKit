//
//  HFPostInfoViewController.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/26.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFPostInfoViewController.h"
#import <Masonry.h>
#import "UIView+UserInfo.h"
#import "UIView+CGRect.h"
#import "HFButton.h"
@implementation HFPostInfoViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"提交信息";
    [self setupTableFooterView];
}
-(void)setupTableView
{
    self.tableView                 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview: self.tableView];
    self.tableView.delegate        = (id)self;
    self.tableView.dataSource      = (id)self;
    

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
-(void)setupData
{
    [super setupData];
    
    HFFormTableCellObj *cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeTextField];
    cellObj.title = @"用户名:";
    cellObj.objName = @"用户名";
    cellObj.objKey =  @"userName";
    cellObj.isRequired = YES;
    cellObj.placeholder = @"请填写用户名";
    [self.cellObjs  addObject:cellObj];
    
    
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeTextField];
    cellObj.title = @"手机号码:";
    cellObj.objName = @"手机号码";
    cellObj.objKey =  @"phone";
    cellObj.isRequired = YES;
    cellObj.regex = @"1\\d{10}";
    [self.cellObjs  addObject:cellObj];
    
    
    
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.title = @"性别:";
    cellObj.objName = @"您的性别";
    cellObj.objKey =  @"sex";
    cellObj.rigthPadding =30;
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellObj.cellAction = @selector(chooseSex:);
    [self.cellObjs  addObject:cellObj];
    
    
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeTextView];
    cellObj.title = @"签名:";
    cellObj.objName = @"签名";
    cellObj.objKey =  @"sign";
    cellObj.topPadding = 5;
    cellObj.accessoryViewSize = CGSizeMake(200, 100);
    cellObj.cellHeigth = 110;
    cellObj.placeholder = @"请输入您的签名";
    [self.cellObjs  addObject:cellObj];
    
}


-(void)setupTableFooterView
{
    UIView *footerView = [UIView new];
    footerView.sizeHeight =70;
    [self.tableView setTableFooterView:footerView];
    
    HFButton *button = [HFButton new];
    [footerView addSubview:button];
    [button addTarget:self action:@selector(submit)];
    [button setTitile:@"提交" textColor:[UIColor whiteColor]];
    [button setNormalBgColor:[UIColor redColor] highlightedBgColor:[UIColor grayColor]];
    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(footerView).offset(10);
        make.bottom.right.equalTo(footerView).offset(-10);
        
    }];
}




#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
    if(buttonIndex == actionSheet.cancelButtonIndex)return;
    
    HFFormTableCellObj *cellObj = actionSheet.userInfo;
    
    cellObj.valueData = @[@"男",@"女"][buttonIndex];
}
#pragma mark event respone
-(void)chooseSex:(HFFormTableCellObj *)cellObj
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择性别" delegate:(id)self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
    sheet.userInfo = cellObj;
    [sheet showInView:self.view];
}

-(void)submit
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //检查参数
    for (HFFormTableCellObj *cellObj in self.cellObjs) {
       NSString *error = [cellObj checkValueError];
        if(error.length >0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"参数错误" message:error delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            return;
        }
    
        [params setValue:cellObj.valueData forKey:cellObj.objKey];
        
    }
    
    NSLog(@"提交参数\n %@",params);
}

@end
