//
//  FXJPageControl.m
//  A-B-C
//
//  Created by myApplePro01 on 16/6/14.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "FXJPageControl.h"

@implementation FXJPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self setUI];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    
    self.currentPage = 0;
    self.pageIndicatorTintColor = [UIColor orangeColor];
    self.currentPageIndicatorTintColor = [UIColor redColor];
    
}
@end
