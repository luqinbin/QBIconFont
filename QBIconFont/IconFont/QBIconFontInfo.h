//
//  QBIconFontInfo.h
//  QBIconfontDemo
//  IconFont字体信息
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBIconFontInfo : NSObject

// 文本
@property (nonatomic, strong) NSString *text;

// 大小
@property (nonatomic, assign) NSInteger size;

// 图片内偏移量
@property (nonatomic, assign) UIEdgeInsets imageInsets;

// 颜色
@property (nonatomic, strong) UIColor *color;

// 背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;

// 字体名字
@property (nonatomic, strong) NSString *fontName;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

- (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color;
+ (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color;

- (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color inset:(UIEdgeInsets)inset NS_DESIGNATED_INITIALIZER;
+ (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color inset:(UIEdgeInsets)inset;

@end

NS_ASSUME_NONNULL_END
