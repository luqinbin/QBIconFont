//
//  UIColor+QBIconFont.h
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/4/20.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (QBIconFont)

+ (UIColor *)qbColorWithHexValue:(NSUInteger)hex;
+ (UIColor *)qbColorWithHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;
+ (UIColor *)qbColorWithShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;
    

/// 随机颜色
+ (UIColor *)qbRandomColor;

/// hex颜色
/// @param hex 颜色字符串
/// @param defaultHex 默认的颜色字符串
/// @param alpha 透明度
+ (UIColor *)qbColorWithHexString:(NSString *)hex defaultHexString:(NSString *)defaultHex alpha:(CGFloat)alpha;

/// hex颜色
/// @param hex 颜色字符串
/// @param alpha 透明度
+ (UIColor *)qbColorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;

/// hex颜色
/// @param hex 颜色字符串
/// @param defaultHex 默认的颜色字符串
+ (UIColor *)qbColorWithHexString:(NSString *)hex defaultHexString:(NSString *)defaultHex;

/// hex颜色
/// @param hex 颜色字符串
+ (UIColor *)qbColorWithHexString:(NSString *)hex;

@end

NS_ASSUME_NONNULL_END
