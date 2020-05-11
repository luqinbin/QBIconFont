//
//  QBIconFontUtils.h
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/5/11.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBIconFontUtils : NSObject

#pragma mark - string
// 是否是空string
+ (BOOL)isEmptyString:(NSString *)string;

#pragma mark - color
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

#pragma mark - Image
/// 圆角裁剪
/// @param image image
/// @param cornerRadius 圆角j直径
+ (UIImage *)qbRoundClipImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;


@end

NS_ASSUME_NONNULL_END
