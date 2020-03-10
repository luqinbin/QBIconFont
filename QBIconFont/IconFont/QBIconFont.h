//
//  QBIconFont.h
//  QBIconfontDemo
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBIconFont : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

/// 初始化，并注册字体
/// @param fontName 字体文件的名字
//- (instancetype)initWithFontName:(NSString *)fontName NS_DESIGNATED_INITIALIZER;

#pragma mark - IconFont
+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color;

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor * _Nullable)backgroundColor;

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent;

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent backgroundColor:(UIColor * _Nullable)backgroundColor;

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset;

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset backgroundColor:(UIColor * _Nullable)backgroundColor;

@end

typedef NSMapTable<NSString *, QBIconFont *> QBCacheIconFonts;

/// 注册并初始化字体
/// @param fontName 字体文件的名字
void QBRegisterFontWithFontName(NSString *fontName);
QBCacheIconFonts *QBGetCacheIconFonts(void);

/// 设置使用的字体名字
/// @param iconFontName 字体的名字
void QBSetIconFont(NSString *iconFontName);

NS_ASSUME_NONNULL_END
