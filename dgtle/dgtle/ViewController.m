//
//  ViewController.m
//  dgtle
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ViewModel.h"
#import "NetWorkEngine.h"
#import "NewHeaderViewController.h"
#import "BackViewController.h"
#import "SliderViewController.h"
#import "ODRefreshControl.h"
#import <WebKit/WebKit.h>
#define HomeData(i)  [NSString stringWithFormat:@"http://www.dgtle.com/api/dgtle_api/v1/api.php?charset=UTF8&dataform=json&swh=480x800&apikeys=DGTLECOM_APITEST1&modules=portal&actions=article&limit=%02d_20&order=dateline_desc",i]
typedef NS_ENUM(NSInteger, CatidType){
        Computer=24,//电脑
        Phone=13,//手机
    //数据太多,后面来集成
};
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SliderViewControllerDelegate,TableViewCellDelegate,NewHeaderViewControllerDelegte>

@property(nonatomic,strong)UIPageControl*pageControl;
@property(nonatomic,strong)NSMutableArray *array;//存放model
@property(nonatomic,assign)CGFloat f1;
@property(nonatomic,strong)WKWebView*webView;
@property(nonatomic,strong)NewHeaderViewController*header;
@property(nonatomic,strong)UIView*vv;
@property(nonatomic,assign)CGFloat f3;//网络通断参数
@property(nonatomic,assign)CGRect fra;
@end

@implementation ViewController

- (void)viewDidLoad {
    
   
    [super viewDidLoad];
    //html不是很好适用app,需要html+css+js 这是一个大工程 克服  试试wkWebView

//    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 50.f, self.view.frame.size.width, self.view.frame.size.height)];
//    self.tableView.backgroundColor=[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:0.8];
    //重新搭建架构
    //加载视图
    //判断网络
    //加载数据
    self.f1=1;
    self.c=1;

     self.array=[NSMutableArray array];
    
    //1, nav+tab  2,na;v back view (xib) 3.tableView的headview (scro +pageControl)
    //首页 tableView 小组tableView的headview (scro +pageControl) +自定义cell里collView
    //发现tableView的headview (scro +pageControl) +自定义cell里collView
    //登录 tableView
    //搭建框架
    //设置导航栏
    [self setNav];
//    self.navigationController.navigationBarHidden=YES;
    [self setMenu];
    //设置tableview
    [self setTableview];
    
   //开启线程判断网络
    [self ConnectNetWoke];
   
//    dispatch_queue_t que=dispatch_get_global_queue(0, 0);
    //异步  并行队列
    int a=0;
    //设置数据
    [self setNetData:a];
    //scroll代理
    //tableView代理了就好
   //cell代理
   //header代理
    
    
    

}
-(void)setMenu{
    //下拉控制刷新
    ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];

}
//下来刷新方法
- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
        //加载数据
        int a=0;
        //设置数据
        [self setNetData:a];
        
    });
}
-(void)viewWillLayoutSubviews{
    
self.tableView.frame = CGRectMake(0, 114.f, self.view.bounds.size.width, self.view.bounds.size.height);
//    self.automaticallyAdjustsScrollViewInsets=NO;
//    self.tableView.tableHeaderView.autoresizingMask=0;
  
    //解决导航栏线
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}
-(void)ConnectNetWoke{
    //开启线程
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(play) object:nil];
    //线程启动
    [thread start];
}


-(void)setHeaderView{
    
    //设置headerView
    NewHeaderViewController*header=[[NewHeaderViewController alloc]init];
    header.delegte=self;
    header.view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    header.view.autoresizingMask=UIViewAutoresizingFlexibleWidth;
    self.scro=header.scrollView;
    //赋值给header文件  代码创建的view传给头view
    self.tableView.tableHeaderView=header.view;
    self.tableView.tableHeaderView.userInteractionEnabled=YES;
    self.header=header;
    self.pageControl=header.pageControl;
//    self.headerData=header.muArray;
//    if (header.aa.count) {
//        
//
//    }
  

}
-(void)setData:(NSArray *)array{

    self.headerData=array;

}
-(void)touchHeader:(float)d{
//    CGPoint  loc=[touch locationInView:self.scro];
//    int s=loc.x/375;
    int s=(int)d;
    //没有数据
 
    NSDictionary *t=[self.headerData objectAtIndex:s];
    NSString*f=t[@"id"];
    NSLog(@"%@",f);
    //http://www.dgtle.com/article-15180-1.html
    NSString*headerName=[NSString stringWithFormat:@"http://www.dgtle.com/article-%d-1.html",[f intValue]];
    NSLog(@"%@",headerName);
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:headerName]]];
    
    UIViewController *viewCro = [[UIViewController alloc] init];
    UIButton*back=[UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    back.frame=CGRectMake(0, 50, 50, 50);
    back.backgroundColor=[UIColor redColor];
    [viewCro.view addSubview:webView];
    [viewCro.view addSubview:back];
    self.webView=webView;
    //    NSLog(@"网页加载启动");
    [self presentViewController:viewCro animated:YES completion:^{
    }];
}
//判断网络是否通畅 self.f3参数  为1通 -1 不通
-(void)play{
        while (1) {
            NSLog(@"我一直在跑");
        NetWorkEngine * netWork_net = [[NetWorkEngine alloc] init];
        //接回数据
        int b=0;
            //歇2秒再跑
            [NSThread sleepForTimeInterval:2];
            //接受数据
        [netWork_net AfJSONGetRequest:HomeData(b)];
            //失败回调
        netWork_net.failBlock=^(id object){
            self.f3=-1;
        };
           //成功回调
        netWork_net.successfulBlock=^(id object){
            self.f3=1;
        };
        //传出去,大家一起用
        _header.viewContro=self.f3;
        
    }


}
-(void)setNetData:(int)a{
    //实例化NetWorkEngine
    NetWorkEngine * netWork = [[NetWorkEngine alloc] init];
    //接回数据
    [netWork AfJSONGetRequest:HomeData(a)];
   //失败回调
    netWork.failBlock=^(id object){//失败的只能从本地加载数据
        //1.获取documents路径
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //2,拼接文件名
        NSString * fileName = [path stringByAppendingPathComponent:@"other.plist"];
        //从plist文件加载数据
        NSMutableArray *tmpArry=[NSMutableArray arrayWithContentsOfFile:fileName];
        //判断有没有加载好
        if (tmpArry==nil) {
            //创建alert
            UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"没网了,请联网" message:@"立马联网,不然就退出去" preferredStyle:UIAlertControllerStyleAlert];
            //创建action
            UIAlertAction*cancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {//点击回调
                    NSLog(@"我出来了");
                    [self viewDidLoad];//看看有没有网 再来一遍
            }];
            //把action加到alert
            [alert addAction:cancle];
            //推出alert
            [self  presentViewController:alert animated:YES completion:^{//成功回调
                NSLog(@"警告");
                
            }];
            
        }
//        self.array=tmpArry;
        //数据有了,准备赋值
        [self Dic2Model:tmpArry with:nil];
    };
     //成功回调
    netWork.successfulBlock = ^(id object){
        //创建数组
        NSDictionary *listArray = object[@"returnData"][@"articlelist"];
       __block NSMutableArray *dic_array=[NSMutableArray array];
      __block  NSDictionary *dd=[NSDictionary dictionary];
        [listArray enumerateKeysAndObjectsUsingBlock:^(NSString* key, id obj, BOOL *stop) {
            dd=(NSDictionary*)obj;
            [dic_array addObject:dd];
        }];
//        NSDictionary *num=[NSDictionary dictionary];
        for (int i=0; i<dic_array.count; i++) {//降序
            for (int j=i; j<dic_array.count-1; j++) {
                
                if ([dic_array[i][@"dateline"] intValue]<[dic_array[j+1][@"dateline"] intValue]) {

                     NSDictionary *num=dic_array[i];
                    dic_array[i]=dic_array[j+1];
                    dic_array[j+1]= num;

            }
                
                
            }
        }
        //1.获取documents路径
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        
        //2,拼接文件名
        NSString * fileName = [path stringByAppendingPathComponent:@"other.plist"];

//        NSLog(@"%@",fileName);

        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:object[@"timestamp"] forKey:@"timestamp"];
        [userDefaults synchronize];
        
        [dic_array writeToFile:fileName atomically:YES];
        [dic_array writeToFile:@"/Users/apple/desktop/other.plist" atomically:YES];
        [self Dic2Model:dic_array with:object];
    };
    
    }
//赋值
-(void)Dic2Model:(NSMutableArray*)dic_array with:(id)object{
    //创建临时可变数据
    __block NSMutableArray*array1=[NSMutableArray array];
    for (NSDictionary *tmp in dic_array) {
        if ([tmp isKindOfClass:[NSDictionary class]]) {
            //moder
            ViewModel * viewModel = [[ViewModel alloc] initWithDictionary:tmp];
            //标题
            viewModel.title=tmp[@"title"];
            //正文
            viewModel.summary=tmp[@"summary"];
            //点赞数
            viewModel.recommend_add=tmp[@"recommend_add"];
            //评论
            viewModel.commentnum=tmp[@"commentnum"];
            //分类
            viewModel.catid=tmp[@"catid"];
            //截止时间
            viewModel.dateline=tmp[@"dateline"];
            //判断是否为空
            if (object==nil) {//用偏好
                //创建NSUserDefaults对象
                NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
                //        userDefaults
                NSNumber*tmp=[userDefaults objectForKey:@"timestamp"];
                //取出数据
                viewModel.timestamp=tmp ;
                
            }else{//有网 当然用最新的
                viewModel.timestamp=object[@"timestamp"];}
                //用户名
                viewModel.username=tmp[@"username"];
                //图片
                viewModel.pic=tmp[@"pic"];
                //头像
                viewModel.uid=tmp[@"uid"];
                //tag_name
                viewModel.tag_name=tmp[@"tag_name"];
               // 文件名
               viewModel.aid=tmp[@"aid"];
               //数组接受模型
               [array1 addObject:viewModel];
        }
    }
    //加载数据  //可能不只一页  追加数据
    [self.array addObjectsFromArray:array1];
    //刷新数据
    [self.tableView reloadData];
    
}
//代理方法  判断是否需要加载下一页
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.f3==-1) {
        NSLog(@"没网了,别拖了");
        
    }else if(self.f3==1){
        //偏移量
    CGPoint pt = [scrollView contentOffset];

//    NSLog(@"%f",pt.y);
    //经验数据  用f1来当页数  一页20个数据
    if ( pt.y>self.tableView.rowHeight*18*self.f1){
        //加载...
        //自加
        self.f1++;
        //加载cell数
        int cellCount=(int)self.f1*20;
        self.tableView.tableFooterView.hidden=NO;

        UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, self.tableView.rowHeight*20*self.f1, 375, 20)];
        footView.backgroundColor=[UIColor redColor];
            UILabel*label=[[UILabel alloc]init];
            label.frame=CGRectMake(0, 0, 375, 20);
            label.text=@"加载数据中";
            label.textAlignment=NSTextAlignmentCenter;
            [footView addSubview:label];
            self.tableView.tableFooterView=footView;
        [self.tableView setNeedsDisplay];

        //加载数据
        [self setNetData:cellCount];
        self.tableView.tableFooterView.hidden=YES;
    }
        
    }
}

-(void)setTableview{
    //代理
    self.tableView.delegate=self;
    //数据源
    self.tableView.dataSource=self;
    //设置行高
    self.tableView.rowHeight = ([UIScreen mainScreen].bounds.size.width * 618/480)+1;
    //设置分离格式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置selecTion的headerView
    [self setHeaderView];
}
- (void)printViewHierarchy:(UIView *)superView
{
    static uint level = 0;
    for(uint i = 0; i < level; i++){
        printf("\t");
    }
    
    const char *className = NSStringFromClass([superView class]).UTF8String;
    const char *frame = NSStringFromCGRect(superView.frame).UTF8String;
    printf("%s:%s\n", className, frame);
    ++level;
    for(UIView *view in superView.subviews){
        [self printViewHierarchy:view];
    }
    --level;
}
-(void)pushLogin{
    NSLog(@"我找到你了");
}
-(void)setNav{
    
//    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    
    
       self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    UIBarButtonItem*first=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"category_menu"] style:UIBarButtonItemStylePlain  target:self action:@selector(newView)];
    UIBarButtonItem*second=[[UIBarButtonItem alloc]initWithTitle:@"数字尾巴" style:UIBarButtonItemStylePlain  target:self action:@selector(pushLogin) ];
    self.navigationItem.leftBarButtonItems=@[first,second];
    UIBarButtonItem*rFirst=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pushLogin)];
    UIBarButtonItem*rSecond=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"inbox"] style:UIBarButtonItemStylePlain target:self action:@selector(pushLogin)];
    self.navigationItem.rightBarButtonItems=@[rFirst,rSecond];
    
    
    SliderViewController*slider=[[SliderViewController alloc]init];
//    UIStoryboard *strory=[UIStoryboard storyboardWithName:@"sliderView" bundle:nil];
//    SliderViewController*slider=[strory instantiateViewControllerWithIdentifier:@"ider"];
//    
//    
//    [self.navigationController pushViewController:slider animated:YES];
    
    slider.delegate=self;
    
    self.vv=slider.view;
    
    self.sliderView=slider;
    
    //后面来改
}


//侧边栏
-(void)newView{
    
   //取反操作  可以拿到什么东西来取反
    
        //没有就生成
    
        //有就移除
    
    
    if (([self.vv superview]==self.navigationController.view)) {
         [self.vv removeFromSuperview];
    }else{
      
        
        CATransition *applicationLoadViewIn =[CATransition animation];
        //
        [applicationLoadViewIn setDuration:0.5];
        //
        [applicationLoadViewIn setType:kCATransitionMoveIn];
        //
//        applicationLoadViewIn.subtype=kCATransitionFromLeft;
        //
        [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        
      

        //加动画
        [[self.navigationController.view  layer]addAnimation:applicationLoadViewIn forKey:kCATransitionMoveIn];
       
       [self.navigationController.view addSubview:self.vv];
        

       
       
        
    }
    
        

    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reUseId=@"cell";
    
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    TableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:reUseId];
//    if (cell != nil)
//    {
//        [cell removeFromSuperview];//处理重用
//    }
//    [cell initWithStyle:initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseId];
//    [cell deq];
    if (cell==nil) {
        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseId];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    //加载模型
    ViewModel * viewModel = [self.array objectAtIndex:indexPath.row];
   
    dispatch_async(dispatch_get_main_queue(), ^{
    
        cell.viewModel=viewModel;
    });
    
    cell.transform=CGAffineTransformMakeScale(0.95, 0.95);//修改不了x,y,可以修改宽高
    cell.delegate=self;
    
    return cell;

}
-(void)backHome{
    self.webView.userInteractionEnabled=YES;
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self.webView removeFromSuperview];
        self.webView=nil;
        
        
    }];
 

}
-(void)cellTouch:(UITouch*)touch{
    NSLog(@"cell被点击了");
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //获取当前点
    CGPoint locP = [touch locationInView:self.tableView];
    int x=locP.y/self.tableView.rowHeight;
//    NSLog(@"%d",x);
    ViewModel*vm=[self.array objectAtIndex:x];
    NSString*fileName=[NSString stringWithFormat:@"http://www.dgtle.com/article-%d-1.html",[vm.aid intValue]];
//    NSLog(@"%@",fileName);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:fileName]]];
    //http://www.dgtle.com/article-15183-1.html
    //http://www.dgtle.com/article-15182-1.html
    //http://www.dgtle.com/article-15181-1.html
  
    UIViewController *viewCro = [[UIViewController alloc] init];
    UIButton*back=[UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    back.frame=CGRectMake(0, 50, 50, 50);
    back.backgroundColor=[UIColor redColor];
    [viewCro.view addSubview:webView];
    [viewCro.view addSubview:back];
    self.webView=webView;
   
//    NSLog(@"网页加载启动");
    [self presentViewController:viewCro animated:YES completion:^{
    
    }];
}
- (void)back2Home{
    /**
     *  CATransition *applicationLoadViewIn =[CATransition animation];
     [applicationLoadViewIn setDuration:duration];
     [applicationLoadViewIn setType:kCATransitionReveal];
     [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
     [[myView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
     */
   //
    CATransition *applicationLoadViewIn =[CATransition animation];
    //
    [applicationLoadViewIn setDuration:0.5];
    //
    [applicationLoadViewIn setType:kCATransitionReveal];
    //
    applicationLoadViewIn.subtype=kCATransitionFromRight;
    //
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];

    //加动画
    [[self.navigationController.view layer]addAnimation:applicationLoadViewIn forKey:kCATransitionMoveIn];

    //移除view
    [self.vv removeFromSuperview];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //当收到内存警告时,移除当前没有在屏幕上显示的视图.
    
    //判断是否可以安全的移除视图控制器的view.
    
    //判断当前的视图控制器的view是否是屏幕上显示.self.view.window
    
    //判断当前视图控制器的view是否已经成功加载.isViewLoaded
    if( self.view.window == nil && [self isViewLoaded]) {
        //安全移除控制器的view;
        self.view = nil;//[_view release];_view = nil;
    }
    //NSLog(@"%@",self.view.window);
    
    
    
    
}

@end
