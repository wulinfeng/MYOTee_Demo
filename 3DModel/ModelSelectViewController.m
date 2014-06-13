//
//  ModelSelectViewController.m
//  3DModel
//
//  Created by Linfeng Wu on 14-5-27.
//  Copyright (c) 2014年 Linfeng Wu. All rights reserved.
//

#import "ModelSelectViewController.h"

@interface ModelSelectViewController ()

@end

@implementation ModelSelectViewController

@synthesize userName = _userName;

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
    
    [self pageCreated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 生成页面元素
- (void)pageCreated
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // Woman
    UIButton *btn_Select_1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Select_1 setFrame:CGRectMake(120, 180, 80, 30)];
    [btn_Select_1 setTitle:@"Woman" forState:UIControlStateNormal];
    [btn_Select_1 addTarget:self action:@selector(btn_SelectPeople:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Select_1];
    
    // 这个地方原本想用图片去代替Button可能会更好看些结果……【也许是我没有设计天赋
//    UIImageView *img_select_1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 160, 320, 100)];
//    img_select_1.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap_1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn_SelectPeople:)];
//    [img_select_1 addGestureRecognizer:tap_1];
//    [img_select_1 setImage:[UIImage imageNamed:@"Menu_Woman"]];
//    [self.view addSubview:img_select_1];
    
    // Man
    UIButton *btn_Select_2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Select_2 setFrame:CGRectMake(120, 240, 80, 30)];
    [btn_Select_2 setTitle:@"Man" forState:UIControlStateNormal];
    [btn_Select_2 addTarget:self action:@selector(btn_SelectBox:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Select_2];
    
    // 同img_select_1所述
//    UIImageView *img_select_2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 260, 320, 100)];
//    img_select_2.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btn_SelectBox:)];
//    [img_select_2 addGestureRecognizer:tap_2];
//    [img_select_2 setImage:[UIImage imageNamed:@"Menu_Man"]];
//    [self.view addSubview:img_select_2];
    
    // 检查页面传值 UserName
    UIButton *btn_Select_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn_Select_3 setFrame:CGRectMake(120, 300, 80, 30)];
    [btn_Select_3 setTitle:@"Check" forState:UIControlStateNormal];
    [btn_Select_3 addTarget:self action:@selector(btn_CheckUserName:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_Select_3];
}

// 跳转至Woman模型选择页面
- (IBAction)btn_SelectPeople:(id)sender
{
    BoxModelViewController *boxPage = [[BoxModelViewController alloc]init];
    [self.navigationController pushViewController:boxPage animated:YES];
    [boxPage setTitle:@"Woman"];
    boxPage.userName = self.userName;
    boxPage.cat = @"Woman";
}

// 跳转至Man选择选择页面
- (IBAction)btn_SelectBox:(id)sender
{
    BoxModelViewController *boxPage = [[BoxModelViewController alloc]init];
    [self.navigationController pushViewController:boxPage animated:YES];
    [boxPage setTitle:@"Man"];
    boxPage.userName = self.userName;
    boxPage.cat = @"Man";
}

// 检查页面传值是否正确
- (IBAction)btn_CheckUserName:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"用户名" message:_userName delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
