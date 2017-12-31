//
//  KVObject.m
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import "KVObject.h"

@interface KVObject () 

@end

@implementation KVObject

// 简单又经典的setter方法
- (void)setHgName:(NSString *)hgName {
//    _hgName = hgName.copy;
    
    // TODO: 在实际开发中, 这里应该会做其它有用的处理的
    // 没有不做其它的处理, 是没有必要重写这个方法的
}

- (void)updateHGName {
    [self willChangeValueForKey:@"hgName"];
    
    [self didChangeValueForKey:@"hgName"];
}

// 简单又经典的getter方法
- (NSString *)hgName {
    // TODO: 在实际开发中, 这里可能需要做一下处理, 用得最多的是懒加载
    return _hgName;
}

@end
