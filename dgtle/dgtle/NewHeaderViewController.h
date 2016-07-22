//
//  NewHeaderViewController.h
//  dgtle
//
//  Created by Apple on 16/7/16.
//  Copyright © 2016年 Apple. All rights reserved.

#import <UIKit/UIKit.h>
#import "ViewController.h"
//
@protocol NewHeaderViewControllerDelegte <NSObject>

-(void)touchHeader:(float)num;
-(void)setData:(NSArray*)array;
@end

@interface NewHeaderViewController : UIViewController
@property (nonatomic, strong)  UIScrollView *scrollView;
@property (nonatomic, strong)  UIPageControl *pageControl;
@property (nonatomic, strong)  UILabel *label;
@property(nonatomic,strong)NSArray*aa;
@property(nonatomic,strong)NSMutableArray*muArray;
@property(nonatomic,assign)CGFloat viewContro;
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic,weak)id<NewHeaderViewControllerDelegte>delegte;
@end
