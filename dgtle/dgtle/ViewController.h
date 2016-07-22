//
//  ViewController.h
//  dgtle
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderViewController.h"

#import "NewHeaderViewController.h"

@interface ViewController : UITableViewController
@property(nonatomic,strong)SliderViewController*sliderView;
//@property(nonatomic,strong)CATransition*Ca;
@property(nonatomic,assign)int c;
@property(nonatomic,strong)UIScrollView*scro;
@property(nonatomic,strong)NSArray*headerData;


@end

