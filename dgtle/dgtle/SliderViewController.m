//
//  SliderViewController.m
//  dgtle
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()


@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView*newView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, self.view.frame.size.height+100)];
    UIView*coverView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, self.view.frame.size.height+100)];
//    coverView.backgroundColor=[UIColor clearColor];
    newView.backgroundColor=[UIColor redColor];
    coverView.backgroundColor=[UIColor blackColor];
      coverView.alpha=0.5;
       
    [self.view addSubview:coverView];
    self.view.frame=coverView.frame;
    self.view.backgroundColor=[UIColor clearColor];
    /**
     *  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]; UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"IDENTIFIER"]; [self.navigationController pushViewController:vc animated:YES];
     */
    

    
    //    [sliderViercontrol.view addSubview:coverView];
    
    self.slideView=newView;
    [self.view addSubview:newView];
//     [self.view addSubview:button];
    // Do any additional setup after loading the view from its nib.
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象
    UITouch * touch = touches.anyObject;
    //获取当前点
    CGPoint locP = [touch locationInView:touch.view];
    if (locP.x>300) {
        
        
        if ([self.delegate respondsToSelector:@selector(needPigMeet)]) {
            [self.delegate needPigMeet];
        }
    }
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
