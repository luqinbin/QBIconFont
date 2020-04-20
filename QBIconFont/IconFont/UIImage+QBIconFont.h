//
//  UIImage+QBIconFont.h
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/4/20.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (QBIconFont)

/// 圆角裁剪
/// @param cornerRadius 圆角j直径
- (UIImage *)qbImageRoundClip:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
