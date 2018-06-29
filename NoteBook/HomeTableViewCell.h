//
//  HomeTableViewCell.h
//  NoteBook
//
//  Created by qiaochun ji on 2018/6/29.
//  Copyright © 2018年 qiaochun ji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVOSCloud/AVOSCloud.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong) AVObject *item;

@end
