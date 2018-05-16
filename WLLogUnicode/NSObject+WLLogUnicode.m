//
//  NSObject+WLLogUnicode.m
//  StoreManages
//
//  Created by 上海旅徒电子商务有限公司 on 2018/5/16.
//  Copyright © 2018年 王立. All rights reserved.
//

#import "NSObject+WLLogUnicode.h"
#import <objc/runtime.h>

@implementation NSObject (WLLogUnicode)
+ (NSString *)wl_stringByReplaceUnicode:(NSString *)string {
    // http://stackoverflow.com/questions/21436956/objc-ios-how-to-retrieve-unicode-hex-code-for-character
    NSMutableString *convertedString = [string mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

+ (BOOL)wl_swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector {
    // http://stackoverflow.com/questions/34542316/does-method-load-need-to-call-super-load
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!originalMethod || !swizzledMethod) {
        return NO;
    }
    
    BOOL didAddMethod = class_addMethod(self,originalSelector,method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    return YES;
}
@end
@implementation NSArray (WLLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self wl_swizzleInstanceMethod:@selector(description) with:@selector(_wl_description)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_wl_descriptionWithLocale:)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_wl_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_wl_description {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_description]];
}

- (NSString *)_wl_descriptionWithLocale:(nullable id)locale {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale]];
}

- (NSString *)_wl_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale indent:level]];
}

#endif

@end

@implementation NSDictionary (WLLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self wl_swizzleInstanceMethod:@selector(description) with:@selector(_wl_description)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_wl_descriptionWithLocale:)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_wl_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_wl_description {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_description]];
}

- (NSString *)_wl_descriptionWithLocale:(nullable id)locale {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale]];
}

- (NSString *)_wl_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale indent:level]];
}

#endif

@end

@implementation NSSet (WLLogUnicode)

#ifdef DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self wl_swizzleInstanceMethod:@selector(description) with:@selector(_wl_description)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:) with:@selector(_wl_descriptionWithLocale:)];
        [self wl_swizzleInstanceMethod:@selector(descriptionWithLocale:indent:) with:@selector(_wl_descriptionWithLocale:indent:)];
    });
}

- (NSString *)_wl_description {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_description]];
}

- (NSString *)_wl_descriptionWithLocale:(nullable id)locale {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale]];
}

- (NSString *)_wl_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [NSObject wl_stringByReplaceUnicode:[self _wl_descriptionWithLocale:locale indent:level]];
}

#endif

@end
