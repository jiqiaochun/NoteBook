//
//  UpdateViewController.m
//  NoteBook
//
//  Created by qiaochun ji on 2018/6/29.
//  Copyright © 2018年 qiaochun ji. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentTextView.text = [self.item objectForKey:@"content"];
    
}

// 更新
- (IBAction)updateBtnClick:(id)sender {
    
    AVQuery *query = [AVQuery queryWithClassName:@"TodoFolder"];
    [query whereKey:@"objectId" equalTo: self.item.objectId];
    
    NSString *content = self.contentTextView.text;
    [self.item setObject:content forKey:@"content"];
    
    AVSaveOption *option = [[AVSaveOption alloc] init];
    option.query = query;
    
    [self.item saveInBackgroundWithOption:option block:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (succeeded) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"error-->%@",error);
        }
        
    }];
    
}

// 删除
- (IBAction)deleteBtnClick:(id)sender {
    
    [self.item deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"error-->%@",error);
        }
    }];
    
}


@end
