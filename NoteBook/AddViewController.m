//
//  AddViewController.m
//  NoteBook
//
//  Created by qiaochun ji on 2018/6/29.
//  Copyright © 2018年 qiaochun ji. All rights reserved.
//

#import "AddViewController.h"

#import <AVOSCloud/AVOSCloud.h>

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 保存
- (IBAction)saveBtnClick:(id)sender {
    
    // 1.采集用户输入的数据
    NSString *content = self.contentTextView.text;
    
    // 2.存储到云端
    AVObject *todoFolder = [[AVObject alloc] initWithClassName:@"TodoFolder"];// 构建对象
    [todoFolder setObject:content forKey:@"content"];// 设置名称
    [todoFolder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"保存成功");
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"error-----%@",error);
        }
    }];//保存到云端
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
