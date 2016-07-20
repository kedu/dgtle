//
//  SliderViewController.h
//  dgtle
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface SliderViewController : UIViewController


#warning 1. 指定协议及代理方法
@protocol SliderViewControllerDelegate <NSObject>

- (void)back2Home;


@end

@interface SliderViewController : UIViewController
@property(nonatomic,strong)UIView*slideView;

#warning 2. 创建一个代理属性
@property (nonatomic, weak) id<SliderViewControllerDelegate> delegate;
@end
