//
//  NewHeaderViewController.h
//  dgtle
//
//  Created by Apple on 16/7/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface NewHeaderViewController : UIViewController
@property(nonatomic,strong)UIView* view_new;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property(strong,nonatomic)NSMutableArray*muArray;
@property(nonatomic,assign)CGFloat viewContro;

@property (nonatomic, strong) NSTimer *timer;

@end
