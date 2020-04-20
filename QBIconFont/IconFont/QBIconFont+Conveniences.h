//
//  QBIconFont+Conveniences.h
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/4/20.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "QBIconFont.h"

NS_ASSUME_NONNULL_BEGIN

@interface QBIconFont (Conveniences)

/// icon透明背景
/// @param unicodeName unicode码
/// @param hexColor icon十六进制颜色
+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName color:(NSString *)hexColor;

/// 圆形icon背景
/// @param unicodeName unicode码
/// @param hexColor icon十六进制颜色
/// @param backgroundHexColor icon背景十六进制颜色
+ (UIImage *)iconInRoundWithUnicodeName:(NSString *)unicodeName color:(NSString *)hexColor backgroundColor:(NSString * _Nullable)backgroundHexColor;


/// 圆形icon背景
/// @param unicodeName unicode码
/// @param hexColor  icon十六进制颜色
/// @param backgroundHexColor icon背景十六进制颜色
/// @param alpha 背景透明度
+ (UIImage *)iconInRoundWithUnicodeName:(NSString *)unicodeName color:(NSString *)hexColor backgroundColor:(NSString * _Nullable)backgroundHexColor backgroundAlpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
