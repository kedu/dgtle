//
//  SliderViewController.m
//  dgtle
//
//  Created by Apple on 16/7/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //要加东西  只能加在newView上
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
    //
    UIImageView*headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
//    headerView.backgroundColor=[UIColor blueColor];
    UIImage*back=[UIImage imageNamed:@"about"];
    headerView.image=back;
    //用户头像
    UIImageView*useImage=[[UIImageView alloc] initWithFrame:CGRectMake(20, 75, 45, 45)];
    useImage.layer.cornerRadius = useImage.frame.size.width/2;
    useImage.layer.masksToBounds=YES;
    CALayer *layer = [useImage layer];
    layer.borderColor = [[UIColor purpleColor] CGColor];
    layer.borderWidth = 1.5f;
    UIImage*use=[UIImage imageNamed:@"雪花"];
    useImage.image=use;
    [headerView addSubview:useImage];
    //用户名
    UILabel*useName=[[UILabel alloc]initWithFrame:CGRectMake(85, 75, 80, 20)];
    useName.text=@"数字尾巴";
    [headerView addSubview:useName];
    //用户等级
    UILabel*level=[[UILabel alloc]initWithFrame:CGRectMake(85, 95, 80, 20)];
    level.text=@"卷缩尾巴";
    level.textColor=[UIColor whiteColor];
    level.backgroundColor=[UIColor grayColor];
    [headerView addSubview:level];
    //指向
    UILabel*point=[[UILabel alloc]initWithFrame:CGRectMake(260, 85, 20, 20)];
    point.text=@">";
    point.textColor=[UIColor whiteColor];
    [headerView addSubview:point];
    
    
    
    [newView addSubview:headerView];
    UITableView*tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 200, 300, self.view.frame.size.height-200)];
    tabView.backgroundColor=[UIColor blackColor];
    //
    tabView.delegate=self;
    tabView.dataSource=self;
    
    
    
    
    [newView addSubview:tabView];

    [self.view addSubview:newView];
    
//     [self.view addSubview:button];
    // Do any additional setup after loading the view from its nib.

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{




    return 60;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 6;
    }else{
        return 4;}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*ident=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ident];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    cell.imageView.image=[UIImage imageNamed:@"group_information"];
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text=@"首页";
                break;
            case 1:
                cell.textLabel.text=@"社区";
                break;
            case 2:
                cell.textLabel.text=@"甩甩尾巴";
                break;
            case 3:
                cell.textLabel.text=@"我的关注";
                break;
            case 4:
                cell.textLabel.text=@"我的收藏";
                break;
            case 5:
                cell.textLabel.text=@"我的帖子";
                break;
            
            default:
                break;
        }
    }else{
        
        
        
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text=@"草稿箱";
                break;
            case 1:
                cell.textLabel.text=@"离线下载";
                break;
            case 2:
                cell.textLabel.text=@"夜间模式";
                break;
            case 3:
                cell.textLabel.text=@"设置";
                break;
            default:
                break;
        }
     
    }
//    tableView.sectionFooterHeight=1;
    
    cell.separatorInset=UIEdgeInsetsMake(100, 20, 100, 20);
    

    tableView.sectionIndexBackgroundColor=[UIColor grayColor];
    //cell分割样式
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //选中样式
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    
    return cell;

}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
//    tableView.sectionIndexBackgroundColor=[UIColor blackColor];
    tableView.sectionIndexBackgroundColor=[UIColor colorWithRed:0 green:0.2 blue:0.3 alpha:0.5];
    tableView.sectionHeaderHeight=1;
    
    
      return @"          ";






}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象
    UITouch * touch = touches.anyObject;
    //获取当前点
    CGPoint locP = [touch locationInView:touch.view];
    if (locP.x>300) {
        
        
        if ([self.delegate respondsToSelector:@selector(back2Home)]) {
            [self.delegate back2Home];
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
