//
//  QBIconFont+Conveniences.m
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/4/20.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "QBIconFont+Conveniences.h"
#import "QBIconFontUtils.h"

static float QBIconFontDefautSize = 100;
static float QBIconDefautPadding = 0.2;

@implementation QBIconFont (Conveniences)

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName color:(UIColor *)color {
    return [self iconWithUnicodeName:unicodeName fontSize:QBIconFontDefautSize color:color];
}

+ (UIImage *)iconWithUnicodeName:(NSString *)unicodeName hexColor:(NSString *)hexColor {
    return [self iconWithUnicodeName:unicodeName fontSize:QBIconFontDefautSize color:[QBIconFontUtils qbColorWithHexString:hexColor]];
}

+ (UIImage *)iconInRoundWithUnicodeName:(NSString *)unicodeName hexColor:(NSString *)hexColor backgroundHexColor:(NSString * _Nullable)backgroundHexColor {
    return [self iconInRoundWithUnicodeName:unicodeName hexColor:hexColor backgroundHexColor:backgroundHexColor backgroundAlpha:1];
}

+ (UIImage *)iconInRoundWithUnicodeName:(NSString *)unicodeName hexColor:(NSString *)hexColor backgroundHexColor:(NSString * _Nullable)backgroundHexColor backgroundAlpha:(float)alpha {
    UIColor *color = [QBIconFontUtils qbColorWithHexString:hexColor];
    UIColor *bgColor = [QBIconFontUtils qbColorWithHexString:backgroundHexColor alpha:alpha];
    UIImage *image = [QBIconFont iconWithUnicodeName:unicodeName
                                            fontSize:QBIconFontDefautSize
                                               color:color
                                             padding:QBIconDefautPadding
                                     backgroundColor:bgColor];
    
    return [QBIconFontUtils qbRoundClipImage:image cornerRadius:image.size.width];
}

@end
