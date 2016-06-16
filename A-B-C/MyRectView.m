//
//  testDrawRect.m
//  A-B-C
//
//  Created by myApplePro01 on 16/6/16.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "MyRectView.h"

@implementation MyRectView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
    
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect{

    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    //开始一个起始路径
    CGContextBeginPath(context);
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, 0, 0);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 100, 100);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 0, 150);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 50, 180);
    //连接上面定义的坐标点
    CGContextStrokePath(context);
    
    
}

@end
