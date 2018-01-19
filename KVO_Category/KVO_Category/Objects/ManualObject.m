//
//  ManualObject.m
//  KVO_Category
//
//  Created by  ZhuHong on 2018/1/19.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ManualObject.h"

@implementation ManualObject

// 从写setter方法
- (void)setManual:(NSString *)manual {
    if (_manual == manual) {
        return;
    }
    
    [self willChangeValueForKey:@"manual"];
    _manual = manual.copy;
    [self didChangeValueForKey:@"manual"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"manual"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

// 与上面的功能一样
//+ (BOOL)automaticallyNotifiesObserversOfManual {
//    return NO;
//}

@end
