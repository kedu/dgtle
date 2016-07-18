//
//  navViewController.m
//  dgtle
//
//  Created by Apple on 16/7/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "navViewController.h"
#import "ViewController.h"
//#import "MenuViewController.h"

@interface navViewController ()

@end

@implementation navViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.red=1;
   
    //导航菜单
    UIView*menuView=[[UIView alloc]initWithFrame:CGRectMake(0, 54, self.view.frame.size.width, 60)];

    UIButton*homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.frame=CGRectMake(0, 10, 375/3.f, 50);
    homeButton.titleLabel.font=[UIFont systemFontOfSize:25];
    [homeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [homeButton setTitle:@"首页" forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(Home) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:homeButton];
    UIButton*groupeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    groupeButton.frame=CGRectMake(375/3*1.f, 10, 375/3.f, 50);
    groupeButton.titleLabel.font=[UIFont systemFontOfSize:25];
    [groupeButton setTitle:@"小组" forState:UIControlStateNormal];
      [groupeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [groupeButton addTarget:self action:@selector(groupeView) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:groupeButton];
    UIButton*findButton=[UIButton buttonWithType:UIButtonTypeCustom];
    findButton.frame=CGRectMake(375/3*2.f, 10, 375/3.f, 50);
    findButton.titleLabel.font=[UIFont systemFontOfSize:25];
    [findButton setTitle:@"发现" forState:UIControlStateNormal];
      [findButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [menuView addSubview:findButton];

    
    menuView.backgroundColor=[UIColor redColor];
    [self.view addSubview:menuView];
    

    
}
-(void)pushLogin{
    NSLog(@"我找到你了");
}
-(void)Home{

    [self popToRootViewControllerAnimated:YES];

}

-(void)groupeView{
    
    GroupeViewController*groupe=[GroupeViewController new];
    

   
        [self pushViewController:groupe animated:YES];
    

}
-(void)dealloc{


}

//-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    
//    if (self.red==1) {
//        
//        [super pushViewController:viewController animated:animated];
//    }
//    
//    
//
//
//
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
