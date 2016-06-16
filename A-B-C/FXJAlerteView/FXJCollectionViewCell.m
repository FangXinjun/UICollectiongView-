//
//  FXJCollectionViewCell.m
//  A-B-C
//
//  Created by myApplePro01 on 16/6/14.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import "FXJCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface FXJCollectionViewCell ()

@property (nonatomic, strong) UIImageView     *imageView;

@end

@implementation FXJCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}

- (void)setImageViewUrlWithUrlStr:(NSString *)strUrl{

    if (strUrl.length > 0) {

        [_imageView sd_setImageWithURL:[NSURL URLWithString:strUrl] placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            _imageView.image = image;
            
        }];
    }
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{

    FXJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FXJCollectionViewCell class]) forIndexPath:indexPath];
    return cell;

}


@end
