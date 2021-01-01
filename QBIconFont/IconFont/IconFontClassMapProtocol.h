//
//  IconFontClassMapProtocol.h
//  QBIconFont
//
//  Created by 覃斌 卢    on 2021/1/1.
//  Copyright © 2021 覃斌 卢   . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString* QBFontClass;
typedef NSString* QBUnicode;

@protocol IconFontClassMapProtocol <NSObject>

+ (NSDictionary<QBFontClass, QBUnicode> *)iconFontClassMap;
+ (QBUnicode)iconfontUnicode:(QBFontClass)fontClass;

@end

NS_ASSUME_NONNULL_END
