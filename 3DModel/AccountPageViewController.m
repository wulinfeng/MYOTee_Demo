//
//  AccountPageViewController.m
//  3DModel
//
//  Created by Linfeng Wu on 14-5-27.
//  Copyright (c) 2014年 Linfeng Wu. All rights reserved.
//

#import "AccountPageViewController.h"
#import "ModelSelectViewController.h"

@interface AccountPageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txb_AccountEnter;

@end

@implementation AccountPageViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_GoNextPage:(id)sender
{
    if ([self.txb_AccountEnter.text isEqualToString:@""] || self.txb_AccountEnter.text == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入用户名" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];

        [alert show];
    }
    else
    {
        ModelSelectViewController *modelSelect = [[ModelSelectViewController alloc]init];
        [self.navigationController pushViewController:modelSelect animated:YES];
        [modelSelect setTitle:@"模型"];
        modelSelect.userName = self.txb_AccountEnter.text;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.txb_AccountEnter isExclusiveTouch]) {
       [self.txb_AccountEnter resignFirstResponder];
    }
}



@end
