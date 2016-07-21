//
//  TableViewCell.h
//  dgtle
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
#warning 1. 指定协议及代理方法
@protocol TableViewCellDelegate <NSObject>
//代理方法
- (void)cellTouch:(UITouch*)touch;

@end

@interface TableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView * iconImage;// 用户头像
@property (nonatomic, strong)UILabel * nameLabel;// 用户姓名
@property (nonatomic, strong)UIButton * catory;// 类别
@property (nonatomic, strong)UILabel *time;// 时间
@property (nonatomic, strong)UIImageView * coverImage;// 封面
@property(nonatomic,strong)UILabel *ArtTitle;
@property (nonatomic, strong)UILabel *subText; //正文
@property (nonatomic, strong)UIButton * rise;//赞
@property (nonatomic, strong)UIButton * commont;//评论
@property (nonatomic, strong)ViewModel * viewModel;//模型
@property(nonatomic,strong)UIButton*tag_name;
//-(instancetype)deq;
@property (nonatomic, weak) id<TableViewCellDelegate> delegate;
@end
