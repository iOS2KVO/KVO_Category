//
//  NSObject+KVO.h
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
//{
//    // 分类中, 是不能这么搞的
//    NSString* _categoryName;
//}

// 属性
@property (nonatomic, copy) NSString* categoryName;

// 附加属性
@property (nonatomic, copy) NSString* extraName;

@end
