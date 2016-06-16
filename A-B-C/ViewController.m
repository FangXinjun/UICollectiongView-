//
//  ViewController.m
//  A-B-C
//
//  Created by myApplePro01 on 16/5/16.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
#import "FXJBackgroundView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 60, 50, 50)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
    
    NSLog(@"a = %p",&self);
    NSLog(@"%zd",sizeof(int));
    NSLog(@"%zd",sizeof(UInt32));
    NSLog(@"%zd",sizeof(long));
    
    
    
    FXJBackgroundView *bgView = [[FXJBackgroundView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    bgView.imagesURL = @[@"http://dev.res.lsh123.com/img/bb/f1502c3c0d3d7bc5673f22",
                         @"http://dev.res.lsh123.com/img/bb/ff65887c35b2fb0f965669",
                         @"http://dev.res.lsh123.com/img/bb/393125b1639eaca15669ed",
                        ];
    [self.view addSubview:bgView];

}

- (void)btnClick{
    BViewController *b = [[BViewController alloc] init];
    [self.navigationController pushViewController:b animated:YES];
    
}

- (void)dealloc{

    NSLog(@"A_dealloc = = %p",&self);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
