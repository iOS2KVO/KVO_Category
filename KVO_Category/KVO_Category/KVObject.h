//
//  KVObject.h
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVObject : NSObject {
    @public
    // 手动定义一个成员变量
    NSString* _hgName;
}

// 属性
@property (nonatomic, copy) NSString* hgName;

- (void)updateHGName;

@end

























