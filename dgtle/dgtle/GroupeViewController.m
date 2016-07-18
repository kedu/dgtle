//
//  GroupeViewController.m
//  dgtle
//
//  Created by Apple on 16/7/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "GroupeViewController.h"

@interface GroupeViewController ()


@end

@implementation GroupeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView*groupeView=[[UIView alloc]initWithFrame:CGRectMake(0, 200, 375, 667)];
    
    
    groupeView.backgroundColor=[UIColor redColor];
    [self.view addSubview:groupeView];
    
    // Do any additional setup after loading the view from its nib.
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
