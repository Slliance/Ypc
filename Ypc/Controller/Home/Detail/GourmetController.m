//
//  GourmetController.m
//  Ypc
//
//  Created by zhangshu on 2019/2/12.
//  Copyright © 2019 zhangshu. All rights reserved.
//

#import "GourmetController.h"
#import "GourmetListCell.h"
#import "HomeServiceApi.h"
#import "GourmetDetailController.h"

@interface GourmetController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation GourmetController

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[GourmetListCell class] forCellReuseIdentifier:NSStringFromClass([GourmetListCell class])];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.tableFooterView = [[UIView alloc]init];
    }
    return _tableview;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"美食家";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc]init];
    [self.view addSubview:self.tableview];
    [self resuestData];
}

-(void)resuestData{
    HomeReq *req = [[HomeReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.appId = @"111557561165794302";
    req.cityName = @"上海市";
    req.cityId = @"310100";
    req.timestamp = @"0";
    //    req.storeId = [UserCacheBean share].userInfo.storeId;
    req.storeId = @"1050650499966791681";
    req.version = @"2.0.0";
    req.subjectId = @"1055363505664245762";
    req.pageIndex = 1;
    req.pageSize = @"100";
    WEAKSELF;
    [[HomeServiceApi share] getGourmentListWithParam:req response:^(id response) {
        if (response) {
            [weakSelf.dataArr removeAllObjects];
            [weakSelf.dataArr addObjectsFromArray:response];
            [weakSelf.tableview reloadData];
        }
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190*(SCREENWIDTH-30)/345+75;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GourmetListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GourmetListCell class])];
    GourmentListRes*model = self.dataArr[indexPath.row];
    [cell setModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GourmetDetailController*vc = [[GourmetDetailController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
