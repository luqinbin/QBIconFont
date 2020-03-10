//
//  QBIconFontHelper.h
//  QBIconfontDemo
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBIconFontHelper : NSObject

/// 取文本的宽度 宽度默认为CGFLOAT_MAX
/// @param string 文本
/// @param font 字体
/// @param maxHeight 最大高度
+ (CGFloat)wmWidthWithString:(NSString *)string font:(UIFont *)font maxHeight:(CGFloat)maxHeight;

@end

NS_ASSUME_NONNULL_END
