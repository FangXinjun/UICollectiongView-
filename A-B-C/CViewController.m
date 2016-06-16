//
//  CViewController.m
//  A-B-C
//
//  Created by myApplePro01 on 16/5/16.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "CViewController.h"
#import "ViewController.h"
@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.center = self.view.center;
    [self.view addSubview:btn];

    NSLog(@"c = %p",&self);
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 10)];
    [self.view addSubview:lineView];
    [self drawDashLine:lineView lineLength:5 lineSpacing:5 lineColor:[UIColor redColor]];

}


/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}


- (void)btnClick{
   
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"AVC"];
    [self.navigationController pushViewController:vc animated:YES];
//    NSLog(@"%zd",self.navigationController.viewControllers.count);
//    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];

    

}

- (void)dealloc{

    NSLog(@"C_dealloc = = %p",&self);
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
