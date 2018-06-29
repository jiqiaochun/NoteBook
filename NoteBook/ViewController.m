//
//  ViewController.m
//  NoteBook
//
//  Created by qiaochun ji on 2018/6/29.
//  Copyright © 2018年 qiaochun ji. All rights reserved.
//

#import "ViewController.h"

#import <AVOSCloud/AVOSCloud.h>
#import "HomeTableViewCell.h"
#import "UpdateViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
}

// 从云端获取数据
- (void)loadData{
    
    // 导入SDK
    // 实例化查询类
    AVQuery *query = [AVQuery queryWithClassName:@"TodoFolder"];
    // 设置查询条件
    // 执行查询
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:objects];
        [self.tableview reloadData];
//        AVObject *item =objects[0];
//        NSLog(@"%@",[item objectForKey:@"content"]);
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AVObject *item = self.dataArray[indexPath.row];
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.item = item;
    cell.textLabel.text = [item objectForKey:@"content"];
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"update"]) {
        
        HomeTableViewCell *cell = sender;
        UpdateViewController *upVc = segue.destinationViewController;
        upVc.item = cell.item;
    }
}

@end
