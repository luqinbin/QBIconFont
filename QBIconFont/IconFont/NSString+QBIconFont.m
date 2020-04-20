//
//  NSString+QBIconFont.m
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/4/20.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "NSString+QBIconFont.h"

@implementation NSString (QBIconFont)

+ (BOOL)isEmpty:(NSString *)string {
    return [string isEqual:[NSNull null]] || string == nil || string.length == 0;
}

@end
