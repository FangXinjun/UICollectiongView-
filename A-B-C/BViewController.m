//
//  BViewController.m
//  A-B-C
//
//  Created by myApplePro01 on 16/5/16.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"
#import "MyRectView.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    NSLog(@"b = %p",&self);
    
    MyRectView *Myview = [[MyRectView alloc] initWithFrame:CGRectMake(0, 50, 320, 320)];
    Myview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:Myview];
    

}

- (void)btnClick{
    CViewController *b = [[CViewController alloc] init];
    [self.navigationController pushViewController:b animated:YES];
    
}

    
- (void)dealloc{

    NSLog(@"B_dealloc = = %p",&self);
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
