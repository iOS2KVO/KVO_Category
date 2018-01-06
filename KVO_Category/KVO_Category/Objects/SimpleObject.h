//
//  SimpleObject.h
//  KVO_Category
//
//  Created by  ZhuHong on 2018/1/6.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

// KVO 回调
typedef void(^KVOBlock)(id oldValue, id newValue);

@interface SimpleObject : NSObject

/** 属性 */
@property (nonatomic, copy) NSString* hgName;

/**
 史上最简单的KVO监听方法

 @param keyPath keyPath
 @param kvoBlock 回调
 */
- (void)addKVOforKeyPath:(NSString*)keyPath kvoBlock:(KVOBlock)kvoBlock;

@end
