//
//  NewHeaderViewController.m
//  dgtle
//
//  Created by Apple on 16/7/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "NewHeaderViewController.h"
#import "NetWorkEngine.h"
#import "UIImageView+WebCache.h"
#import "ViewController.h"
#define kWidth  375
#define HomeDate [NSString stringWithFormat:@"http://www.dgtle.com/api/dgtle_api/v1/api.php?charset=UTF8&dataform=json&swh=480x800&apikeys=DGTLECOM_APITEST1&modules=portal&actions=diydata&bid=274"]

#define kImageCount 5

@interface NewHeaderViewController ()<UIScrollViewDelegate>

@end

@implementation NewHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //

    //创建数组
    self.muArray=[NSMutableArray array];
   //设置frame
//    self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, 100);
    //创建pageCtrol
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(kWidth/2, 35, 40, 5)];
//    设置ui
    [self setupUI];

    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];

    self.view.userInteractionEnabled=YES;
    self.scrollView.userInteractionEnabled=YES;

    
    //看这边button有没有响应
    NSLog(@"%d",[self respondsToSelector:@selector(touchesBegan:withEvent:)]);//可以响应
    //看是否能被点击
    // 不能被点击
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (1) {
            if (self.muArray.count) {
                if ([self.delegte respondsToSelector:@selector(setData:)]) {
                    [self.delegte setData:self.muArray];
                    break;
                }
                
            }

        }
        
        
    });
    }

-(void)clickCategory{
    NSLog(@"我被点击了");
    float c= self.pageControl.currentPage;
    if ([self.delegte respondsToSelector:@selector(touchHeader:)]) {
        [self.delegte touchHeader:c];
    }


}

-(void)setupUI{
    //创建scrollView
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 80)];
    //创建lab
    UILabel*lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, kWidth, 20)];
    
    lab.font=[UIFont systemFontOfSize:12];
    lab.textAlignment=NSTextAlignmentCenter;
     self.label=lab;
    [self.view addSubview:self.label];
    lab.backgroundColor=[UIColor redColor];

    self.scrollView.delegate=self;
    [self setImage];
    [self setupPageControll];

    // 创建计时器

    [self initImageTimer];
    [self.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory)]];
    
}
// Decelerating 减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // currentPage = scrollView.contentOffset.x / kScrollViewSize.width
    
    _pageControl.currentPage = scrollView.contentOffset.x / kWidth;
}

- (void)setupPageControll {
    
    // 设置总共有几个点
    _pageControl.numberOfPages = kImageCount;
    
    // 设置指示器的颜色
    // 非当前的指示器
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    // 设置当前指示器的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    // 设置当前在第几个点 , 取值范围是 0 .. numberOfPages - 1
    // 设置的currentPage如果超出最大的范围， 就在最后一个显示
    // 设置的currentPage如果超出最小的范围 就在第一个显示
    _pageControl.currentPage = 0;
}
/**
 在开始拖拽的时候， 把计时器停止
 
 invalidate 无效的意思
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 让计时器无效
    if (self.muArray.count) {
        
        [_timer invalidate];
    }
}

/**
 当停止拖拽的时候， 让计时器开始工作
 手指离开scrollView的时候
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
         if (self.muArray.count) {
        [_timer fire];
        
        
        [self initImageTimer];
         }
    
}
- (void)initImageTimer {
    /**
     scheduled 计划，安排
     interval : 间隔
     target :  一般指控制器
     selector: 方法
     userInfo : 用户自定义的参数
     repeats: 重复
     
     每隔1秒钟 调用 控制器的  didClickButton： 方法， 传递的参数为nil
     
     一旦创建就会立即生效
     
     在使用timer的时候， 如果调用了 invalidate方法， 那么这个计时器就不会再次生效
     重新创建新的timer
     */
   
    _timer = [NSTimer scheduledTimerWithTimeInterval:2
                                              target:self
                                            selector:@selector(didClickButton:)
                                            userInfo:nil
                                             repeats:YES];
    
    // [_timer fire];  调用fire ， 这个计时器会立即执行， 不会等待 interval 设置的时间
    
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    
    
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
- (IBAction)didClickButton:(id)sender {
    /**
     1. 取出scrollView的contentOffset
     2. 取出 pagecontroll 的 currentPage
     3. 进行修改
     4. 赋值回去
     */
    
    // 1. 取出 contentOffset
    CGPoint offset = _scrollView.contentOffset;
    
    // 2. currentPage
    NSInteger currentPage = _pageControl.currentPage;
    
    // 3. 进行修改
//    [self.scrollView bringSubviewToFront:self.pageControl];
    
    if (currentPage == 4) {
        // 到了最后一张, 再次点击的时候， 到第一张图片的位置
        // currentPage 修改为0
        currentPage = 0;
        
        // 修改 scrollView的contentOffset
        offset = CGPointZero;
        
    } else {
        
        currentPage += 1;
        
        offset.x += kWidth;
    }
    if (self.muArray.count) {
        
        switch (currentPage) {
            case 0:
                self.label.text=self.muArray[0][@"title"];
                
                break;
            case 1:
                self.label.text=self.muArray[1][@"title"];
                
                break;
            case 2:
                self.label.text=self.muArray[2][@"title"];
                
                break;
            case 3:
                self.label.text=self.muArray[3][@"title"];
                
                break;
            case 4:
                self.label.text=self.muArray[4][@"title"];
                
                break;
                
            default:
                break;
        }
    }
    
    // 4. 赋值回去
    _pageControl.currentPage = currentPage;
    [_scrollView setContentOffset:offset animated:YES];
    
}


-(void)setImage{
    //实例化NetWorkEngine
    NetWorkEngine * netWork = [[NetWorkEngine alloc] init];
    //接回数据
    [netWork AfJSONGetRequest:HomeDate];
    netWork.failBlock=^(id object){
        //1.获取documents路径
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //2,拼接文件名
        NSString * fileName = [path stringByAppendingPathComponent:@"image.plist"];
        NSMutableArray *tmpArry=[NSMutableArray arrayWithContentsOfFile:fileName];
        if (tmpArry==nil) {
            UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"没网了,请联网" message:@"立马联网,不然就退出去" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*cancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                               NSLog(@"我出来了");
                [self viewDidLoad];
            }];
            [alert addAction:cancle];
            [self  presentViewController:alert animated:YES completion:^{
                NSLog(@"警告");
                
            }];

        }
        for (int i = 0; i < kImageCount; i++) {
            // 计算imageView的x值
            CGFloat imageViewX = i * kWidth;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, kWidth, self.view.frame.size.height-20)];
            NSDictionary*dic=tmpArry[i];
            //
            self.muArray=tmpArry;
            
            
            
            
            [imageView  sd_setImageWithURL:[NSURL URLWithString:dic[@"pic_url"]]];
            
            
            [_scrollView addSubview:imageView];
            
            
        }
    
        
    };
    netWork.successfulBlock=^(id object){
    
        NSDictionary*listArray=object[@"returnData"][@"blocklist"][@"274"];
        __block NSMutableArray *dic_array=[NSMutableArray array];
        __block  NSDictionary *dd=[NSDictionary dictionary];
        [listArray enumerateKeysAndObjectsUsingBlock:^(NSString* key, id obj, BOOL *stop) {
            dd=(NSDictionary*)obj;
            [dic_array addObject:dd];
        }];
        
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //2,拼接文件名
        NSString * fileName = [path stringByAppendingPathComponent:@"image.plist"];
        [dic_array writeToFile:fileName atomically:YES];
       
       
       
        for (int i = 0; i < kImageCount; i++) {
            // 计算imageView的x值
            CGFloat imageViewX = i * kWidth;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, kWidth, _scrollView.frame.size.height)];
            NSDictionary*dic=dic_array[i];
            
            
            [imageView  sd_setImageWithURL:[NSURL URLWithString:dic[@"pic_url"]]];
          
            NSLog(@"%@",NSStringFromCGRect(imageView.frame));
//            imageView.contentMode=UIViewContentModeScaleAspectFill;
            imageView.userInteractionEnabled=YES;
            /**
             *  [bbc setUserInteractionEnabled:YES];
             [voaspecial setUserInteractionEnabled:YES];
             [bbc addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
             [voaspecial addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
             */
//            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tt)]];
            

            [_scrollView addSubview:imageView];
            
            
        }
//        [self.view addSubview:self.scrollView];
//        [self.view addSubview:self.pageControl];
        self.muArray=dic_array;

    };
       // 设置 scrollView的contentSize
    _scrollView.contentSize = CGSizeMake(kImageCount * kWidth, 0);
    
    // 隐藏滚动指示器
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    // scrollView的分页效果 (根据scrollView的宽度进行分页的)
    _scrollView.pagingEnabled = YES;
    
}
@end
