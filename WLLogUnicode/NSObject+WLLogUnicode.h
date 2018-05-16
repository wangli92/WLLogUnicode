//
//  NSObject+WLLogUnicode.h
//  StoreManages
//
//  Created by wl on 2018/5/16.
//  Copyright © 2018年 wl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WLLogUnicode)
+ (NSString *)wl_stringByReplaceUnicode:(NSString *)string;

+ (BOOL)wl_swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector;
@end


@interface NSArray (WLLogUnicode)

@end

@interface NSDictionary (WLLogUnicode)

@end

@interface NSSet (WLLogUnicode)

@end
