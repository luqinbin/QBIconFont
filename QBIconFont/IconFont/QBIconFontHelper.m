//
//  QBIconFontHelper.m
//  QBIconfontDemo
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "QBIconFontHelper.h"

@implementation QBIconFontHelper

+ (CGFloat)wmWidthWithString:(NSString *)string font:(UIFont *)font maxHeight:(CGFloat)maxHeight {
    return [self wmSizeWithString:string font:font maxSize:CGSizeMake(CGFLOAT_MAX, maxHeight) lines:1].width;
}

+ (CGSize)wmSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize lines:(NSInteger)lines {
    return [self wmSizeWithString:string font:font maxSize:maxSize lines:lines lineSpacing:0];
}

+ (CGSize)wmSizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize lines:(NSInteger)lines lineSpacing:(CGFloat)lineSpacing {
    if ([self WMIsEmpty:string]) {
        return CGSizeZero;
    }
    if (CGSizeEqualToSize(CGSizeZero, maxSize)) {
        maxSize = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    }
    if (lines == 1) {
        NSDictionary *attrs = @{NSFontAttributeName : font};
        CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        if (size.width == 0) {
            size = CGSizeZero;
        }
        return CGSizeMake(ceil(MIN(size.width, maxSize.width)), ceil(size.height));
    } else {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];
        CGFloat newLineSpacing = lineSpacing - (font.lineHeight - font.pointSize);
        if (newLineSpacing < 0) {
            newLineSpacing = 0;
        }
        [style setLineSpacing:newLineSpacing];
        
        NSDictionary *attrs = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : style};
        CGSize oneSize = [string sizeWithAttributes:attrs];
        CGSize size = [string boundingRectWithSize:maxSize options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attrs context:nil].size;
        NSInteger actualLines = (NSInteger)(size.height / oneSize.height);
        if (actualLines >= lines) {
            size = CGSizeMake(ceil(maxSize.width), ceil(lines * oneSize.height));
        } else {
            size = CGSizeMake(ceil(maxSize.width), ceil(actualLines * oneSize.height));
        }
        return size;
    }
    return CGSizeZero;
}

+ (BOOL)WMIsEmpty:(NSString *)string {
    return [string isEqual:[NSNull null]] || string == nil || string.length == 0;
}

@end
