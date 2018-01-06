//
//  SimpleObject.m
//  KVO_Category
//
//  Created by  ZhuHong on 2018/1/6.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "SimpleObject.h"

@interface Path8KVOBlockObject : NSObject

/** 被监听的 keyPath */
@property (nonatomic, copy) NSString* keyPath;
/** 被监听的 回调 */
@property (nonatomic, copy) KVOBlock  kvoBlock;

@end

@implementation Path8KVOBlockObject

@end

@interface SimpleObject ()

// 数组
@property (nonatomic, strong) NSMutableArray* keyPath8KVOBlockArrM;

@end

@implementation SimpleObject

/**
 史上最简单的KVO监听方法
 
 @param keyPath keyPath
 @param kvoBlock 回调
 */
- (void)addKVOforKeyPath:(NSString*)keyPath kvoBlock:(KVOBlock)kvoBlock {
    if (!keyPath || !kvoBlock) {
        return;
    }
    // 初始化 _keyPath8KVOBlockArrM
    if (!_keyPath8KVOBlockArrM) {
        _keyPath8KVOBlockArrM = [NSMutableArray array];
    }
    
    // 获取
    Path8KVOBlockObject* pbObject = [self pbObjectForKeyPath:keyPath];
    if (!pbObject) {
        // 没有就重新创建
        pbObject = [[Path8KVOBlockObject alloc] init];
        [_keyPath8KVOBlockArrM addObject:pbObject];
    }
    // 赋值
    pbObject.keyPath = keyPath;
    pbObject.kvoBlock = kvoBlock;
    
}

- (void)setHgName:(NSString *)hgName {
    // 保留旧值
    NSString* oldValue = _hgName;
    // 赋值
    _hgName = hgName.copy;
    
    // 找到对应的监听, 然后执行
    Path8KVOBlockObject* pbObject = [self pbObjectForKeyPath:@"hgName"];
    if (pbObject.kvoBlock) {
        pbObject.kvoBlock(oldValue, _hgName);
    }
}


// 查找是否监听过 keyPath
- (Path8KVOBlockObject*)pbObjectForKeyPath:(NSString*)keyPath {
    if (_keyPath8KVOBlockArrM.count == 0) {
        return nil;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.keyPath CONTAINS [c]%@", keyPath];
    NSArray* filtereds = [self.keyPath8KVOBlockArrM filteredArrayUsingPredicate:predicate];
    if (filtereds.count == 0) {
        return nil;
    }
    return filtereds.firstObject;
}

- (void)dealloc {
    NSLog(@"SimpleObject ==== dealloc");
}

@end
