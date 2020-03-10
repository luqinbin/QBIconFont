//
//  QBIconFontInfo.m
//  QBIconfontDemo
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "QBIconFontInfo.h"

@implementation QBIconFontInfo

- (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    return [self initWithFontName:fontName text:text size:size color:color inset:UIEdgeInsetsZero];
}

+ (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color {
    return [[QBIconFontInfo alloc] initWithFontName:fontName text:text size:size color:color];
}

- (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color inset:(UIEdgeInsets)inset {
    self = [super init];
    if (self) {
        self.fontName = fontName;
        self.text = text;
        self.size = size;
        self.color = color;
        self.imageInsets = inset;
    }
    return self;
}

+ (instancetype)initWithFontName:(NSString *)fontName text:(NSString *)text size:(NSInteger)size color:(UIColor *)color inset:(UIEdgeInsets)inset {
    return [[QBIconFontInfo alloc] initWithFontName:fontName text:text size:size color:color inset:inset];
}

@end
