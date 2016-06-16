//
//  FXJCollectionView.m
//  A-B-C
//
//  Created by myApplePro01 on 16/6/14.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "FXJCollectionView.h"
#import "FXJCollectionViewCell.h"

NSString * const ID = @"myCell";

@implementation FXJCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self setUI];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
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
    self.backgroundColor = [UIColor clearColor];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    [self registerClass:[FXJCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FXJCollectionViewCell class])];
    self.scrollsToTop = NO;
    
}



@end
