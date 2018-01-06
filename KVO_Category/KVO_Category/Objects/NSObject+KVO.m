//
//  NSObject+KVO.m
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)

#pragma mark -
#pragma mark - 动态给分类添加"成员变量"
static const char HGCategoryNameKey = '\0';
// setter方法
- (void)setCategoryName:(NSString *)categoryName {
    // 如果相等, 则返回
    if (categoryName == self.categoryName) {
        return;
    }
    
    // OBJC_ASSOCIATION_COPY_NONATOMIC  == (nonatomic, copy)
    
    // 即将改变
    [self willChangeValueForKey:@"extraName"];
//    [self willChangeValueForKey:@"categoryName"];

    // 改变中
    objc_setAssociatedObject(self, &HGCategoryNameKey,
                             categoryName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSString* extraName = [categoryName stringByAppendingString:@"_extraName"];
    objc_setAssociatedObject(self, &HGExtraNameKey,
                             extraName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // 已经改变
    [self didChangeValueForKey:@"extraName"];
//    [self didChangeValueForKey:@"categoryName"];
}

// getter方法
- (NSString *)categoryName {
    return objc_getAssociatedObject(self, &HGCategoryNameKey);
}


static const char HGExtraNameKey = '\0';
// setter方法
- (void)setExtraName:(NSString *)extraName {
    // 如果相等, 则返回
    if (extraName == self.extraName) {
        return;
    }
    
    // OBJC_ASSOCIATION_COPY_NONATOMIC  == (nonatomic, copy)
    objc_setAssociatedObject(self, &HGExtraNameKey,
                             extraName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// getter方法
- (NSString *)extraName {
    return objc_getAssociatedObject(self, &HGExtraNameKey);
}

#pragma mark -
#pragma mark - 在分类中没有这种写法
//- (NSString *)categoryName {
//    return _categoryName;
//}

@end
