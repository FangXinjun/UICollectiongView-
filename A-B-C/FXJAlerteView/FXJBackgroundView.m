//
//  FXJAlerteView.m
//  A-B-C
//
//  Created by myApplePro01 on 16/6/12.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "FXJBackgroundView.h"
#import "FXJCollectionViewCell.h"
#import "FXJCollectionView.h"
#import "FXJPageControl.h"

#define MaxSections 10
@interface FXJBackgroundView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) FXJCollectionView     *collectionView;

@property (nonatomic, strong) FXJPageControl        *pageControl;

@property (nonatomic, strong) NSTimer               *timer;

@property (nonatomic, strong) NSMutableArray     *tempImagesURL;

@end


@implementation FXJBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
     
        [self commont];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super initWithCoder:aDecoder]) {
        [self commont];
    }
    return self;
}

- (void)commont
{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.backgroundColor = [UIColor whiteColor];
    _collectionView = [[FXJCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    _pageControl = [[FXJPageControl alloc] init];
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
//        [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(nextImage) userInfo:nil repeats:NO];
    
    [self addSubview:_collectionView];
    [self addSubview:_pageControl];
    
}



- (void)nextImage
{
    
    [UIView animateWithDuration:0.1 animations:^{
        _collectionView.contentOffset=CGPointMake(_collectionView.contentOffset.x+self.bounds.size.width,_collectionView.contentOffset.y);
    } completion:^(BOOL finished) {
        if (_collectionView.contentOffset.x>=_collectionView.contentSize.width-self.bounds.size.width) {
            _collectionView.contentOffset=CGPointMake(self.bounds.size.width,_collectionView.contentOffset.y);
            _pageControl.currentPage=0;
        }
        else if (_collectionView.contentOffset.x<self.bounds.size.width) {
            _collectionView.contentOffset=CGPointMake(_collectionView.contentSize.width-(self.bounds.size.width*2),_collectionView.contentOffset.y);
            _pageControl.currentPage=_collectionView.contentOffset.x/self.bounds.size.width-1;
        }
        else{
            _pageControl.currentPage=_collectionView.contentOffset.x/self.bounds.size.width-1;
        }
    }];

    
//    CGFloat pageWith = _collectionView.frame.size.width;
//    NSInteger currentPage = floor((_collectionView.contentOffset.x - pageWith/ (_tempImagesURL.count)) / pageWith) + 1;
//
//    // 1.下一页
//    if (self.pageControl.currentPage == _imagesURL.count - 1) {
//        self.pageControl.currentPage = 0;
//        NSLog(@"%f",_collectionView.contentOffset.x);
//        [_collectionView scrollRectToVisible:CGRectMake(_collectionView.frame.size.width * _imagesURL.count, 0, _collectionView.frame.size.width, _collectionView.frame.size.height) animated:NO];
//        NSLog(@"%f",_collectionView.contentOffset.x);
//
//    } else if(currentPage == _imagesURL.count + 1){
//        NSLog(@"%f",_collectionView.contentOffset.x);
//
//        [_collectionView scrollRectToVisible:CGRectMake(_collectionView.frame.size.width, 0, _collectionView.frame.size.width,_collectionView.frame.size.height) animated:NO
//         ];
//        
//        NSLog(@"%f",_collectionView.contentOffset.x);
//
//    }else{
//    
//        self.pageControl.currentPage++;
//
////        CGPoint offset = CGPointMake(self.collectionView.frame.size.width * self.pageControl.currentPage, 0);
////        [self.collectionView setContentOffset:offset animated:YES];
//
//    }
    
//    NSLog(@"%f",_collectionView.contentOffset.x);
//    // 2.设置滚动
//    CGPoint offset = CGPointMake(self.collectionView.frame.size.width * self.pageControl.currentPage, 0);
//    [self.collectionView setContentOffset:offset animated:YES];
    
    
    
}


- (void)setImagesURL:(NSArray<NSString *> *)imagesURL{
    _imagesURL = imagesURL;
    _pageControl.numberOfPages = imagesURL.count;
    _tempImagesURL = [NSMutableArray arrayWithArray:imagesURL];
    [_tempImagesURL insertObject:[imagesURL lastObject] atIndex:0];
    [_tempImagesURL addObject:imagesURL[0]];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _collectionView.frame = self.bounds;
    _pageControl.frame = CGRectMake(0, self.bounds.size.height - 10, self.bounds.size.width, 50);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tempImagesURL.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FXJCollectionViewCell *cell = [FXJCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    [cell setImageViewUrlWithUrlStr:self.tempImagesURL[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",(long)indexPath.row);
}

// 定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWith = scrollView.frame.size.width;
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWith/ (_tempImagesURL.count)) / pageWith) + 1;
    
    if (currentPage == 0) {
        
        [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width * _imagesURL.count, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
        
    }else if(currentPage == _imagesURL.count + 1){
        [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width, 0, scrollView.frame.size.width,scrollView.frame.size.height) animated:NO
         ];
    }else{
        
    }
}

@end
