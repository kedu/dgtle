//
//  ViewModel.h
//  dgtle
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject
@property(nonatomic,copy)NSString*title;//标题
@property(nonatomic,copy)NSString*pic;//图片
@property(nonatomic,copy)NSString*summary;//正文
@property(nonatomic,copy)NSString*username;//用户名
@property(nonatomic,copy)NSString*uid;//用户头像
@property(nonatomic,copy)NSString*catid;//类别
@property(nonatomic,strong)NSNumber*dateline;//提交时间
@property(nonatomic,strong)NSNumber*timestamp;//最后一次
@property(nonatomic,copy)NSNumber*recommend_add;//点赞
@property(nonatomic,copy)NSString*aid;//文件名
@property(nonatomic,strong)NSNumber*commentnum;//评论
@property (nonatomic, copy)NSString * ID;//其他属性
@property(nonatomic,copy)NSString*tag_name;
- (id)initWithDictionary:(NSDictionary *)dic;

@end
