//
//  TableViewCell.m
//  dgtle
//
//  Created by Apple on 16/7/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"
#define UIScreen_Width [UIScreen mainScreen].bounds.size.width
#define UIScreen_Height [UIScreen mainScreen].bounds.size.height


@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.catory];
        [self addSubview:self.time];
        [self addSubview:self.coverImage];
        [self addSubview:self.ArtTitle];
        [self addSubview:self.subText];
        [self addSubview:self.rise];
        [self addSubview:self.commont];
        [self addSubview:self.tag_name];

        
    }
    return self;
}
-(UIButton *)tag_name{

    _tag_name=[UIButton buttonWithType:UIButtonTypeCustom];
    _tag_name.frame=CGRectMake(10, self.commont.frame.origin.y, 100, 40);

    
    [_tag_name setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   
    
    

    return _tag_name;}
-(UIButton *)commont{
    if (!_commont) {
        _commont=[UIButton buttonWithType:UIButtonTypeCustom];
        _commont.frame=CGRectMake(UIScreen_Width-50, self.rise.frame.origin.y, 40, 20);
        [_commont setTitle:@"50" forState:UIControlStateNormal];
//        _commont.backgroundColor=[UIColor grayColor];
//        _commont.font=[UIFont systemFontOfSize:12];
        _commont.titleLabel.font=[UIFont systemFontOfSize:12];
        [_commont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }

    return _commont;}
-(UIButton *)rise{
    if (!_rise) {
        _rise=[UIButton buttonWithType:UIButtonTypeCustom];
        _rise.frame=CGRectMake(UIScreen_Width-100, CGRectGetMaxY(self.subText.frame), 40, 20);
//        _rise.backgroundColor=[UIColor grayColor];
//        _rise.font=[UIFont systemFontOfSize:12];
        _rise.titleLabel.font=[UIFont systemFontOfSize:12];
        
        [_rise setTitle:@"100" forState:UIControlStateNormal];
        [_rise setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }

    return _rise;}
-(UILabel *)subText{
    if (!_subText) {
        
        _subText=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.ArtTitle.frame)+5, UIScreen_Width, 40)];
        _subText.text=@"我是内容";
        _subText.numberOfLines=0;
        _subText.lineBreakMode=NSLineBreakByTruncatingTail;
        _subText.font=[UIFont systemFontOfSize:15];
    }




    return _subText;}
-(UILabel *)ArtTitle{
    if (!_ArtTitle) {
        /**
         NSLineBreakByWordWrapping = 0,     	// Wrap at word boundaries, default
         NSLineBreakByCharWrapping,		// Wrap at character boundaries
         NSLineBreakByClipping,		// Simply clip
         NSLineBreakByTruncatingHead,	// Truncate at head of line: "...wxyz"
         NSLineBreakByTruncatingTail,	// Truncate at tail of line: "abcd..."
         NSLineBreakByTruncatingMiddle	// Truncate middle of line:  "ab...yz"

         */
//        _ArtTitle.lineBreakMode=NSLineBreakByTruncatingMiddle;
        
       
        _ArtTitle=[[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.coverImage.frame)+5,UIScreen_Width , 60)];
        //    CGRectMaxXEdge
//        _ArtTitle.backgroundColor=[UIColor redColor];
        _ArtTitle.text=@"我是标题,看着还不错吧";
//        _ArtTitle.font=[UIFont systemFontOfSize:12];
        _ArtTitle.numberOfLines=0;
        
    }




    return _ArtTitle;}
- (UIImageView *)coverImage
{
    if (!_coverImage) {
        self.coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height+10, UIScreen_Width, ([UIScreen mainScreen].bounds.size.width * 618/480)+1-_iconImage.frame.size.height-20-150)];
                _coverImage.backgroundColor = [UIColor redColor];
    }
    return _coverImage;
}
-(UILabel *)time{
    _time=[[UILabel alloc]initWithFrame:CGRectMake(300, 30, 50, 20)];
    _time.font=[UIFont systemFontOfSize:12];
    _time.text=@"12小时";




    return _time;}
- (UIImageView *)iconImage
{   //如果为空
    if (!_iconImage) {
        //实例化
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        //        _iconImage.backgroundColor = [UIColor redColor];
        //        设置圆角
        _iconImage.layer.cornerRadius = _iconImage.frame.size.width/2;
        //设置
        _iconImage.layer.masksToBounds = YES;
        //实例化CALayer
        CALayer *layer = [_iconImage layer];
        
        layer.borderColor = [[UIColor purpleColor] CGColor];
        layer.borderWidth = 1.5f;
    }
    return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImage.frame.origin.x+_iconImage.frame.size.width+10, _iconImage.frame.origin.y, UIScreen_Width, _iconImage.frame.size.height/2)];
        _nameLabel.text = @"数字尾巴";
//        _nameLabel.backgroundColor=[UIColor redColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

-(UIButton *)catory{
    if (!_catory) {
        _catory=[UIButton buttonWithType:UIButtonTypeCustom];
        _catory.frame=CGRectMake(self.nameLabel.frame.origin.x-14, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+5, 85, 20);
//        _catory.imageView=[UIImageView alloc]initWithImage:<#(nullable UIImage *)#>
//        _catory.backgroundColor=[UIColor clearColor];
        [_catory setTitle:@"我来了" forState:UIControlStateNormal];
        [_catory setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _catory.titleLabel.font = [UIFont systemFontOfSize:12];
        [_catory setImage:[UIImage imageNamed:@"category_flight_pressed"] forState:UIControlStateNormal];
        
    }
    return _catory;
}

-(void)setViewModel:(ViewModel *)viewModel{
   // dispatch_async(dispatch_get_main_queue(), ^{

        _viewModel=viewModel;
        _ArtTitle.text=viewModel.title;
        //    NSLog(@"%@",_ArtTitle.text);
        _subText.text=viewModel.summary;
        NSString*riseTitle=[NSString stringWithFormat:@"%@",viewModel.recommend_add];
    [_commont setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    
        [_rise setTitle:riseTitle forState:UIControlStateNormal];
        NSString*commont=[NSString stringWithFormat:@"%@",viewModel.commentnum ];
    [_rise setImage:[UIImage imageNamed:@"recommend"] forState:UIControlStateNormal];
        [_commont setTitle:commont forState:UIControlStateNormal];
        NSString*caty=viewModel.catid;
    switch ([caty intValue]) {
        case 24:
            
             [_catory setTitle:@"电脑" forState:UIControlStateNormal];
            break;
        case 22:
//            [_catory setImage:[UIImage imageNamed:@"category_mouse_pressed"] forState:UIControlStateNormal];
            [_catory setTitle:@"游戏" forState:UIControlStateNormal];
            break;
        case 37:
            [_catory setTitle:@"咨讯" forState:UIControlStateNormal];
            break;
        case 36:
            [_catory setTitle:@"沙龙" forState:UIControlStateNormal];
            break;
        case 35:
            [_catory setTitle:@"旅行" forState:UIControlStateNormal];
            break;
        case 30:
            [_catory setTitle:@"应用" forState:UIControlStateNormal];
            break;
        case 32:
            [_catory setTitle:@"应用" forState:UIControlStateNormal];
            break;
        case 13:
            [_catory setTitle:@"手机" forState:UIControlStateNormal];
            break;
        case 3:
            [_catory setTitle:@"手机" forState:UIControlStateNormal];
            break;
        case 9:
            [_catory setTitle:@"数码" forState:UIControlStateNormal];
            break;
        case 19:
            [_catory setTitle:@"影音" forState:UIControlStateNormal];
            break;
        case 7:
            [_catory setTitle:@"生活" forState:UIControlStateNormal];
            break;
        case 5:
            [_catory setTitle:@"周边" forState:UIControlStateNormal];
            break;

        case 38:
            [_catory setTitle:@"咨讯" forState:UIControlStateNormal];
            break;
        case 8:
            [_catory setTitle:@"摄影" forState:UIControlStateNormal];
            break;
        case 23:
            [_catory setTitle:@"活动" forState:UIControlStateNormal];
            break;
        case 21:
            [_catory setTitle:@"玩物" forState:UIControlStateNormal];
            break;
            
        default:[_catory setTitle:caty forState:UIControlStateNormal];
            break;
            
    }
    
    
        float time=[viewModel.timestamp floatValue] -[viewModel.dateline floatValue];
        float realTime=time/3600;
        if (realTime>=24) {
            realTime=realTime/24;
            _time.text=[NSString stringWithFormat:@"%d天前",(int)realTime];
            
        }else if(realTime<1){
            realTime=realTime*60;
            _time.text=[NSString stringWithFormat:@"%d分钟前",(int)realTime];}
        else{
         _time.text=[NSString stringWithFormat:@"%d小时前",(int)realTime];
        
        }
        
        _nameLabel.text=viewModel.username;
        NSString *name_url=[NSString stringWithFormat:@"http://img.dgtle.com/%@",viewModel.pic];
        /**
         *
         */
        //    NSURL *nameUrl=[NSURL URLWithString:name_url];
        //    NSURLRequest*request=[NSURLRequest requestWithURL:nameUrl];
        //    NSURLSession*session_cover=[NSURLSession sharedSession];
        //    NSURLSessionTask *task=[session_cover dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        if (data) { // 判断服务器是否响应回来数据.如果有响应数据,说明肯定访问成功!
        //
        //            // 这句代码是调试的时候最常用的一句代码!
        ////            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        ////            <#Description#>
        ////            NSLog(@"jsonString:%@",jsonString);
        ////            NSString *image_str=[NSString stringEncodingForData:data encodingOptions:NULL convertedString:NULL usedLossyConversion:YES];
        //
        //            UIImage *image=[UIImage imageWithData:data];
        //            _coverImage.image=image;
        //
        //        }
        //
        //    }];
        //    [task resume];
        /**
         *  <#Description#>
         //     */
        [_coverImage sd_setImageWithURL:[NSURL URLWithString:name_url]];
        int uid_int=[viewModel.uid intValue];
        if (uid_int!=0) {
            
            //    NSLog(@"%d",uid_int);
            //076456 //439284
            
            int a=uid_int/10000;
            int b=uid_int/100%100;
            int c=uid_int%100;
            
            NSString *str_iconImage=[NSString stringWithFormat:@"http://www.dgtle.com/uc_server/data/avatar/000/%02d/%02d/%02d_avatar_small.jpg",a,b,c];
            //        NSLog(@"%@",str_iconImage);
            NSURL *url_iconImage=[NSURL URLWithString:str_iconImage];
            
            [_iconImage sd_setImageWithURL:url_iconImage];
        }else{
            
            
            _iconImage.image=nil;}
    
   
    [_tag_name setTitle:viewModel.tag_name forState:UIControlStateNormal];
    if (![viewModel.tag_name isEqual:@""]) {
        UIImage*tag_image=[UIImage imageNamed:@"category_pen"];
        [_tag_name setImage:tag_image forState:UIControlStateNormal];
    }
    
}
-(void)prepareForReuse{
    [super prepareForReuse];
    self.viewModel=nil;
    _tag_name.imageView.image=nil;

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
