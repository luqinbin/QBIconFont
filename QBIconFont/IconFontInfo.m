//
//  IconFontInfo.m
//  QBIconFont
//
//  Created by 覃斌 卢    on 2021/1/1.
//  Copyright © 2021 覃斌 卢   . All rights reserved.
//

#import "IconFontInfo.h"

@implementation IconFontInfo

+ (NSDictionary<QBFontClass, QBUnicode> *)iconFontClassMap {
    return @{
        @"auto": @"e6eb",
        @"all": @"e6ef",
        @"bussiness-man": @"e6f0",
        @"component": @"e6f2",
        @"copy": @"e6f3",
        @"history": @"e6f8",
        @"editor": @"e6f6",
        @"data": @"e6f9",
        @"gift": @"e6fa",
    };
};

+ (QBUnicode)iconfontUnicode:(QBFontClass)fontClass {
    NSString *unicode = [[self iconFontClassMap] valueForKey:fontClass];

#ifdef DEBUG
    if (unicode.length < 1) {
        NSString *errorMsg = [NSString stringWithFormat:@"[QBIconFont] FontClass:【%@】 doesn't exist", fontClass];
        NSLog(@"%@", errorMsg);
    }

#endif

    return unicode;
}

@end
