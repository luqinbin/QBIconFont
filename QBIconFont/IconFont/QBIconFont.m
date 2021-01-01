//
//  QBIconFont.m
//  QBIconfontDemo
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "QBIconFont.h"
#import "QBIconFontInfo.h"
#import "QBIconFontUtils.h"
#import "IconFontClassMapProtocol.h"
#import <CoreText/CoreText.h>

static QBCacheIconFonts *cacheIconFonts;
static NSString *QBIconFontName;
static Class<IconFontClassMapProtocol> iconFontMapClass;

@implementation QBIconFont

- (instancetype)initWithFontName:(NSString *)fontName {
    self = [super init];
    if (self) {
        NSAssert(!([fontName isEqual:[NSNull null]] || [fontName isEqualToString:@""]), @"Font name doesn't empty");
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:fontName withExtension:@"ttf"];
        [self registerFontWithURL:fontFileUrl];
    }
    return self;
}

- (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

#pragma mark - initWithUnicodeName
+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color {
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color backgroundColor:nil];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor * _Nullable)backgroundColor {
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color inset:UIEdgeInsetsZero backgroundColor:backgroundColor];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent {
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color padding:paddingPercent backgroundColor:nil];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent backgroundColor:(UIColor * _Nullable)backgroundColor {
    CGFloat padding = size * paddingPercent;
    UIEdgeInsets inset = UIEdgeInsetsMake(padding, padding, padding, padding);
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color inset:inset backgroundColor:backgroundColor];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset {
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color inset:inset backgroundColor:nil];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset backgroundColor:(UIColor * _Nullable)backgroundColor {
    return [self iconWithFontName:QBIconFontName unicodeName:unicodeName fontSize:size color:color inset:inset backgroundColor:backgroundColor];
}

+ (UIImage *)iconWithFontName:(NSString *)fontName unicodeName:(NSString *)unicodeName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset backgroundColor:(UIColor * _Nullable)backgroundColor {
    if (![unicodeName hasPrefix:@"&#x"]) {
        unicodeName = [NSString stringWithFormat:@"&#x%@", unicodeName];
    }
    NSString *unicode = [QBIconFontUtils qbConvertHTMLToAttributedString:unicodeName].string;
    
    QBIconFontInfo *info = [[QBIconFontInfo alloc] initWithFontName:fontName text:unicode size:size color:color inset:inset];
    if (backgroundColor) {
        info.backgroundColor = backgroundColor;
    }
    return [self iconWithInfo:info];
}

#pragma mark - initWithFontClassName
+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color];
}

+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor * _Nullable)backgroundColor {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color backgroundColor:backgroundColor];
}

+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color padding:paddingPercent];
}

+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color padding:(CGFloat)paddingPercent backgroundColor:(UIColor * _Nullable)backgroundColor {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color padding:paddingPercent backgroundColor:backgroundColor];
}

+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color inset:inset];
}

+ (UIImage *)iconWithFontClassName:(NSString *)fontClassName fontSize:(CGFloat)size color:(UIColor *)color inset:(UIEdgeInsets)inset backgroundColor:(UIColor * _Nullable)backgroundColor {
    NSString *unicodeName = [self iconfontUnicode:fontClassName];
    return [self iconWithUnicodeName:unicodeName fontSize:size color:color inset:inset backgroundColor:backgroundColor];
}


#pragma mark - Private
+ (UIImage *)iconWithInfo:(QBIconFontInfo *)fontInfo {
    CGFloat w1 = fontInfo.size - fontInfo.imageInsets.left - fontInfo.imageInsets.right;
    CGFloat w2 = fontInfo.size - fontInfo.imageInsets.top - fontInfo.imageInsets.bottom;
    CGFloat size = MIN(w1, w2);
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = [UIFont fontWithName:fontInfo.fontName size:realSize];
    CGFloat imageSize = fontInfo.size * scale;
    
    UIGraphicsBeginImageContext(CGSizeMake(imageSize, imageSize));
    if (fontInfo.backgroundColor) {
        [fontInfo.backgroundColor set];
        UIRectFill(CGRectMake(0.0, 0.0, imageSize, imageSize)); //fill the background
    }
    CGPoint point = CGPointMake(fontInfo.imageInsets.left * scale, fontInfo.imageInsets.top * scale);
    [fontInfo.text drawAtPoint:point withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: fontInfo.color}];
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    return image;
}

+ (NSString *)iconfontUnicode:(NSString *)fontClass {
    NSString *unicodeName = [[iconFontMapClass class] iconfontUnicode:fontClass];
    return unicodeName;
}

@end


#pragma mark - setup function
void QBRegisterFontWithFontName(NSString *fontName) {
    if ([QBGetCacheIconFonts() objectForKey:fontName] != nil) {
        return;
    }
    
    QBIconFont *font = [[QBIconFont alloc] initWithFontName:fontName];
    if (font) {
        @synchronized ([QBIconFont class]) {
            [QBGetCacheIconFonts() setObject:font forKey:fontName];
        }
    }
}

QBCacheIconFonts *QBGetCacheIconFonts(void) {
    @synchronized ([QBIconFont class]) {
        if (cacheIconFonts) {
            return cacheIconFonts;
        }
        cacheIconFonts = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory capacity:1];
         
        return cacheIconFonts;
    }
}

void QBSetIconFont(NSString *iconFontName) {
    QBIconFontName = iconFontName;
}

void QBRegisterFontClassMap(Class<IconFontClassMapProtocol> mapClass) {
    iconFontMapClass = mapClass;
}
