//
//  HFTableViewController.m
//  HFKitDemo
//
//  Created by helfy  on 15/8/18.
//  Copyright (c) 2015年 helfy. All rights reserved.
//

#import "HFBaseTableViewController.h"

@implementation HFBaseTableViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
     
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupData];
    [self setupDataDidFinish];

    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)setupData
{
    self.cellObjs= [NSMutableArray array];
    
}


-(void)reloadData
{
    [self setupData];
    [self setupDataDidFinish];
    [self.tableView reloadData];
}
//设置完成之后需要对Cell的Obj提取设置一些东西
-(void)setupDataDidFinish
{
    if (self.isSectionData) {
        for (NSArray *sectionSrray in self.cellObjs) {
            for (HFTableCellObj *cellObj in sectionSrray) {
                [self.tableView registerClass:NSClassFromString(cellObj.tablViewCellClassName) forCellReuseIdentifier:cellObj.cellIdentifier];
            }
        }
    }
    else{
        for (HFTableCellObj *cellObj in self.cellObjs) {
            [self.tableView registerClass:NSClassFromString(cellObj.tablViewCellClassName) forCellReuseIdentifier:cellObj.cellIdentifier];
        }
    }
    
 
}
#pragma mark - setupView
-(void)setupTableView{
    
    self.tableView  =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview: self.tableView];
    self.tableView .delegate = (id)self;
    self.tableView .dataSource = (id)self;
    self.tableView.frame = self.view.frame;
}


#pragma mark -- 键盘弹起 & 收起
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)keyboardWillShow:(NSNotification *)notification{
    CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    float height = rect.size.height;
    
    [self.tableView setContentInset:UIEdgeInsetsMake(self.tableView.contentInset.top, self.tableView.contentInset.left, height, self.tableView.contentInset.right)];
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    int section = 0;
    int row =0;
    BOOL find = NO;
    if(self.isSectionData)
    {
        
        for (section =0 ;section<self.cellObjs.count;section++) {
            NSArray *sectionArray =self.cellObjs[section];
            for (row =0 ;row<sectionArray.count;row++) {
                HFTableViewCell *obj = sectionArray[row];
                if([obj isFirstResponder])
                {
                    find = YES;
                    break;
                }
            }
            if(find)break;
        }
      
    }
    else{
        for (row =0 ;row<self.cellObjs.count;row++) {
            HFTableViewCell *obj = self.cellObjs[row];
            if([obj isFirstResponder])
            {
                find = YES;
                break;
            }
        }
     
    }

    if(find)
    {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}

-(void)keyboardWillHide:(NSNotification *)notification{
    [self.tableView setContentInset:UIEdgeInsetsMake(self.tableView.contentInset.top, self.tableView.contentInset.left, 0, self.tableView.contentInset.right)];
}

#pragma mark UITableViwDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isSectionData) {
        return self.cellObjs.count;
    }
    else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isSectionData) {
        return [self.cellObjs[section] count];
    }
    else{
        return self.cellObjs.count;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    HFTableCellObj *cellObj = [self cellObjForIndexPath:indexPath];
    if([cellObj isKindOfClass:[HFCustomTableCellObj class]])
    {
        Class cellClass= NSClassFromString(cellObj.tablViewCellClassName);
        return [cellClass cellHeigthForData:(HFCustomTableCellObj *)cellObj];
    }
    else if([cellObj isKindOfClass:[HFFormTableCellObj class]])
    {
        return cellObj.cellHeigth;
    }
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)sender cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HFTableCellObj *cellObj = [self cellObjForIndexPath:indexPath];
    HFTableViewCell *cell = [sender dequeueReusableCellWithIdentifier:cellObj.cellIdentifier forIndexPath:indexPath];
    [cell bindData:cellObj];
    return cell;
}
- (void)tableView:(UITableView *)sender didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [sender deselectRowAtIndexPath:indexPath animated:YES];
    HFTableCellObj *cellObj = [self cellObjForIndexPath:indexPath];
    
    if(cellObj.cellAction){
        
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:cellObj.cellAction withObject:cellObj];
    }
    else if(cellObj.pushToClass)
    {
        UIViewController *controller = [[[cellObj pushToClass] alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    
}
#pragma mark 数据提取
//设置的数据是否是Section模式
-(BOOL)isSectionData
{
    if(self.cellObjs.count >0)
    {
        if([[self.cellObjs firstObject] isKindOfClass:[NSArray class]])
        {
            return YES;
        }
    }
    return NO;
}
-(HFTableCellObj *)cellObjForIndexPath:(NSIndexPath *)indexPath
{
    HFTableCellObj *cellObj = nil;
    if (self.isSectionData) {
        cellObj =  self.cellObjs[indexPath.section][indexPath.row];
    }
    else{
        cellObj =self.cellObjs[indexPath.row];
    }
    return cellObj;
}

-(HFFormTableCellObj *)cellObjForObjKey:(NSString *)objKey
{
    HFFormTableCellObj *cellObj = nil;
    
    if(self.isSectionData)
    {
        for (NSArray *array in self.cellObjs) {
            for (HFTableCellObj *subObj  in array) {
                if([subObj isKindOfClass:[HFFormTableCellObj class]])
                {
                    if([((HFFormTableCellObj *)subObj).objKey isEqualToString:objKey])
                    {
                        return (HFFormTableCellObj *)subObj;
                    }
                }
            }
        }
    
    }
    else
    {
        for (HFTableCellObj *subObj  in self.cellObjs) {
            
            if([subObj isKindOfClass:[HFFormTableCellObj class]])
            {
                if([((HFFormTableCellObj *)subObj).objKey isEqualToString:objKey])
                {
                    return (HFFormTableCellObj *)subObj;
                }
            }
        }
    }
    return cellObj;
}

@end
