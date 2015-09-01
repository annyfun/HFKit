//
//  ViewController.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/17.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "ViewController.h"
#import "HFButton.h"
#import "HFTextField.h"
#import "HFTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"实用案例";
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView
{
    self.tableView                 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview: self.tableView];
    self.tableView.delegate        = (id)self;
    self.tableView.dataSource      = (id)self;
    self.tableView.frame           = self.view.frame;
    
    //不采用系统的分割线
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
}

-(HFFormTableCellObj *)lineObjForLetfPadding:(float)leftPadding
{
   HFFormTableCellObj * cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLine];
    cellObj.cellHeigth=0.5;
    cellObj.rigthPadding=0;
    cellObj.leftPadding=leftPadding;
    
    return cellObj;
}


-(void)setupData
{
    [super setupData];
    

    [self.cellObjs addObject:[self lineObjForLetfPadding:0]];
    
   HFFormTableCellObj* cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellObj.title = @"提交信息";
    cellObj.image = [UIImage imageNamed:@"settingIcon"];
    //    cellObj.imageSize = CGSizeMake(20, 20);
    cellObj.cellHeigth = 50;
    cellObj.valueData = @"HFPostInfoViewController";
    cellObj.pushToClass = NSClassFromString(@"HFPostInfoViewController");
    
    cellObj.accessoryViewSize = CGSizeMake(180, 40);
    cellObj.rigthPadding=0;
    {
        UILabel *label = (UILabel *)cellObj.accessoryView;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
    }
    [self.cellObjs addObject:cellObj];

    
    [self.cellObjs addObject:[self lineObjForLetfPadding:15]];
    
    cellObj = [[HFFormTableCellObj alloc] initWithAccessoryMode:HFFormAccessoryModeLabel];
    cellObj.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellObj.title = @"设置";
    cellObj.image = [UIImage imageNamed:@"settingIcon"];
    cellObj.cellHeigth = 50;
    cellObj.valueData = @"HFSettingViewController";
    cellObj.accessoryViewSize = CGSizeMake(180, 40);
    cellObj.pushToClass = NSClassFromString(@"HFSettingViewController");
    cellObj.rigthPadding=0;
    {
        UILabel *label = (UILabel *)cellObj.accessoryView;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
    }
    [self.cellObjs addObject:cellObj];
 
    
    [self.cellObjs addObject:[self lineObjForLetfPadding:0]];
}

@end
