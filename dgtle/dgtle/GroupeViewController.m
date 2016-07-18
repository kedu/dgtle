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
    
    
    
    self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    UIBarButtonItem*first=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"category_menu"] style:UIBarButtonItemStylePlain  target:self action:@selector(pushLogin)];
    UIBarButtonItem*second=[[UIBarButtonItem alloc]initWithTitle:@"数字尾巴" style:UIBarButtonItemStylePlain  target:self action:@selector(pushLogin) ];
    self.navigationItem.leftBarButtonItems=@[first,second];
    UIBarButtonItem*rFirst=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pushLogin)];
    UIBarButtonItem*rSecond=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"inbox"] style:UIBarButtonItemStylePlain target:self action:@selector(pushLogin)];
    self.navigationItem.rightBarButtonItems=@[rFirst,rSecond];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)pushLogin{
    NSLog(@"我找到你了");
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
