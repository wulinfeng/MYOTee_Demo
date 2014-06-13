//
//  BoxModelViewController.m
//  3DModel
//
//  Created by Linfeng Wu on 14-5-28.
//  Copyright (c) 2014年 Linfeng Wu. All rights reserved.
//

#import "BoxModelViewController.h"

@interface BoxModelViewController ()

@property (strong, nonatomic) UIScrollView *sv;
@property (strong, nonatomic) UIImageView *img_Display;

@end

@implementation BoxModelViewController

@synthesize userName = _userName;
@synthesize record = _record;
@synthesize sv = _sv;
@synthesize img_Display = _img_Display;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.record = [[ModelRecord alloc]init];
    self.record.userName = self.userName;
    self.record.Hair = self.record.Eyes = self.record.Mouth = 1;
    self.record.cat = self.cat;
    self.record.time = @"2014";
    
    [self pageCreated:self.cat];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"It's %@'s page!", self.cat] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pageCreated:(NSString *)sex
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 导航栏保存按钮 NavigationBar
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(btn_Save:)];
    
    [self.navigationItem setRightBarButtonItem:saveItem];
    
    // 初始化sv
    self.sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 480, 320, 80)];
    self.sv.contentSize = CGSizeMake(350, 0);
//    [self.sv setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.sv];
    [self changeSV_Hair:self.cat];
    
    // 初始化changeButton
    UIButton *btn_Hair = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Hair setFrame:CGRectMake(20, 440, 80, 20)];
    [btn_Hair setTitle:@"Hair" forState:UIControlStateNormal];
    [btn_Hair addTarget:self action:@selector(btn_ChangeHair:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Hair];
    
    UIButton *btn_Eyes = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Eyes setFrame:CGRectMake(120, 440, 80, 20)];
    [btn_Eyes setTitle:@"Eyes" forState:UIControlStateNormal];
    [btn_Eyes addTarget:self action:@selector(btn_ChangeEyes:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Eyes];
    
    UIButton *btn_Mouth = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Mouth setFrame:CGRectMake(220, 440, 80, 20)];
    [btn_Mouth setTitle:@"Mouth" forState:UIControlStateNormal];
    [btn_Mouth addTarget:self action:@selector(btn_ChangeMouth:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Mouth];

    // 初始化Display图片
    if ([self.cat isEqual:@"Man"])
    {
        self.img_Display = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Man_111"]];
        self.img_Display.frame = CGRectMake(0, 110, 320, 290);
        [self.view addSubview:self.img_Display];
    }
    else
    {
        //...
    }
}

// 改变Hair SV
- (void)changeSV_Hair:(NSString *)sex
{
    for (UIView *view in self.sv.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIImageView *view_1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, -60, 99, 70)];
    view_1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Hair:)];
    [view_1 addGestureRecognizer:tap_1];
    tap_1.view.tag = 1;
    [self.sv addSubview:view_1];
    
    UIImageView *view_2 = [[UIImageView alloc]initWithFrame:CGRectMake(109, -60, 99, 70)];
    view_2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Hair:)];
    [view_2 addGestureRecognizer:tap_2];
    tap_2.view.tag = 2;
    [self.sv addSubview:view_2];
    
    if ([sex isEqualToString:@"Man"])
    {
        [view_1 setImage:[UIImage imageNamed:@"Man_Hair_1"]];
        [view_2 setImage:[UIImage imageNamed:@"Man_Hair_2"]];
    }
    else if ([sex isEqualToString:@"Woman"])
    {
        //...
    }
}

// 改变Eyes SV
- (void)changeSV_Eyes:(NSString *)sex
{
    for (UIView *view in self.sv.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIImageView *view_1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, -60, 99, 70)];
    view_1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Eyes:)];
    [view_1 addGestureRecognizer:tap_1];
    tap_1.view.tag = 1;
    [self.sv addSubview:view_1];
    
    UIImageView *view_2 = [[UIImageView alloc]initWithFrame:CGRectMake(109, -60, 99, 70)];
    view_2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Eyes:)];
    [view_2 addGestureRecognizer:tap_2];
    tap_2.view.tag = 2;
    [self.sv addSubview:view_2];
    
    UIImageView *view_3 = [[UIImageView alloc]initWithFrame:CGRectMake(213, -60, 99, 70)];
    view_3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Eyes:)];
    [view_3 addGestureRecognizer:tap_3];
    tap_3.view.tag = 3;
    [self.sv addSubview:view_3];
    
    if ([sex isEqualToString:@"Man"])
    {
        [view_1 setImage:[UIImage imageNamed:@"Man_Eyes_1"]];
        [view_2 setImage:[UIImage imageNamed:@"Man_Eyes_2"]];
        [view_3 setImage:[UIImage imageNamed:@"Man_Eyes_3"]];
    }
    else if ([sex isEqualToString:@"Woman"])
    {
        //...
    }
}

// 改变Mouth SV
- (void)changeSV_Mouth:(NSString *)sex
{
    for (UIView *view in self.sv.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIImageView *view_1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, -60, 99, 70)];
    view_1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Mouth:)];
    [view_1 addGestureRecognizer:tap_1];
    tap_1.view.tag = 1;
    [self.sv addSubview:view_1];
    
    UIImageView *view_2 = [[UIImageView alloc]initWithFrame:CGRectMake(109, -60, 99, 70)];
    view_2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Mouth:)];
    [view_2 addGestureRecognizer:tap_2];
    tap_2.view.tag = 2;
    [self.sv addSubview:view_2];
    
    UIImageView *view_3 = [[UIImageView alloc]initWithFrame:CGRectMake(213, -60, 99, 70)];
    view_3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Mouth:)];
    [view_3 addGestureRecognizer:tap_3];
    tap_3.view.tag = 3;
    [self.sv addSubview:view_3];
    
    if ([sex isEqualToString:@"Man"])
    {
        [view_1 setImage:[UIImage imageNamed:@"Man_Mouth_1"]];
        [view_2 setImage:[UIImage imageNamed:@"Man_Mouth_2"]];
        [view_3 setImage:[UIImage imageNamed:@"Man_Mouth_3"]];
    }
    else if ([sex isEqualToString:@"Woman"])
    {
        //...
    }
}

// 改变Color SV
- (void)changeSV_Color:(NSString *)sex
{
    UIImageView *view_1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, -60, 99, 70)];
    view_1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Color:)];
    [view_1 addGestureRecognizer:tap_1];
    tap_1.view.tag = 1;
    [self.sv addSubview:view_1];
    
    UIImageView *view_2 = [[UIImageView alloc]initWithFrame:CGRectMake(109, -60, 99, 70)];
    view_2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Color:)];
    [view_2 addGestureRecognizer:tap_2];
    tap_2.view.tag = 2;
    [self.sv addSubview:view_2];
    
    UIImageView *view_3 = [[UIImageView alloc]initWithFrame:CGRectMake(213, -60, 99, 70)];
    view_3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap_3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage_Color:)];
    [view_3 addGestureRecognizer:tap_3];
    tap_3.view.tag = 3;
    [self.sv addSubview:view_3];
    
    if ([sex isEqualToString:@"Man"])
    {
        //...
    }
    else if ([sex isEqualToString:@"Woman"])
    {
        //...
    }
}

// 底部四个Button的点击事件
- (IBAction)btn_ChangeHair:(id)sender
{
    [self changeSV_Hair:self.cat];
}

- (IBAction)btn_ChangeEyes:(id)sender
{
    [self changeSV_Eyes:self.cat];
}

- (IBAction)btn_ChangeMouth:(id)sender
{
    [self changeSV_Mouth:self.cat];
}

- (IBAction)btn_ChangeColor:(id)sender
{
    //[self changeSV_Color:self.cat];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"该区域未完成！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];
}

// SV图片的点击事件
- (void)onClickImage_Hair:(id)sender
{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    int num = tap.view.tag;
    [self.img_Display setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Man_%d%d%d", num, self.record.Eyes, self.record.Mouth]]];
    
    self.record.Hair = num;
}

- (void)onClickImage_Eyes:(id)sender
{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    int num = tap.view.tag;
    [self.img_Display setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Man_%d%d%d", self.record.Hair, num, self.record.Mouth]]];
    
    self.record.Eyes = num;
}

- (void)onClickImage_Mouth:(id)sender
{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    int num = tap.view.tag;
    [self.img_Display setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Man_%d%d%d", self.record.Hair, self.record.Eyes, num]]];
    
    self.record.Mouth = num;
}

- (void)onClickImage_Color:(id)sender
{
    //...
}

// 右上角Save的点击事件
- (IBAction)btn_Save:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定将模型数据发送至后台？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}

// 生成JSON字符串
- (void)CreateJSONString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"当前时间：%@", date);
    
    self.record.time = date;
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%@", self.record.userName], @"UserName",
                         [NSString stringWithFormat:@"%@", self.record.cat], @"Cat",
                         [NSString stringWithFormat:@"%d", self.record.Hair], @"Hair",
                         [NSString stringWithFormat:@"%d", self.record.Eyes], @"Eyes",
                         [NSString stringWithFormat:@"%d", self.record.Mouth], @"Mouth",
                         [NSString stringWithFormat:@"Black"], @"Color",
                         [NSString stringWithFormat:@"%@", self.record.time], @"Time",
                         nil];
    
    NSString *str = [dic JSONString];
    NSLog(@"%@", str);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^(void)
                   {
                       NSString *strUrl = @"http://127.0.0.1:5000/postdata";
                       NSURL *url = [NSURL URLWithString:strUrl];
                       NSMutableURLRequest *mRequest = [[NSMutableURLRequest alloc] init];
                       [mRequest setURL:url];
                       [mRequest setTimeoutInterval:1000];
                       [mRequest setHTTPMethod:@"POST"];

                       [mRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                       
                       NSString *body = [NSString stringWithFormat:@"user=%@&cat=%@&hair=%@&eyes=%@&mouth=%@&color=%@&time=%@", dic[@"UserName"], dic[@"Cat"], dic[@"Hair"], dic[@"Eyes"], dic[@"Mouth"], dic[@"Color"], dic[@"Time"]];
                       [mRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
                       NSURLResponse *mResponse;
                       NSError *mError;
                       NSData *data = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&mResponse error:&mError];
                       NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       
                       if ([content isEqual:@""])
                       {
                           UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"发送失败，无返回值" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                           [alert show];
                       }
                       else
                       {
                           NSLog(@"\n%@",content);
                       }
                   });
}

// 实现UIAlertView点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self CreateJSONString];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已取消发送！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }
}

@end
