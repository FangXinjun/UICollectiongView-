//
//  FXJCollectionViewCell.h
//  A-B-C
//
//  Created by myApplePro01 on 16/6/14.
//  Copyright © 2016年 LSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXJCollectionViewCell : UICollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
- (void)setImageViewUrlWithUrlStr:(NSString *)strUrl;

@end
