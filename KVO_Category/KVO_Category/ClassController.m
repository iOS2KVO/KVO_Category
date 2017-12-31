//
//  ClassController.m
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import "ClassController.h"
#import "NSObject+KVO.h"

@interface ClassController ()

/** 属性 */
@property (nonatomic, strong) NSObject* kObj;

@end

@implementation ClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSObject* kObj = [[NSObject alloc] init];
    kObj.categoryName = @"我是分类名字";
    NSLog(@"%@", kObj.categoryName);
    self.kObj = kObj;
    
    // 添加KVO监听
    [kObj addObserver:self forKeyPath:@"categoryName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

// 系统监听KVO变化的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.kObj.categoryName = @"分类名字被修改";
}


- (void)dealloc {
    // 移除KVO监听
    [self.kObj removeObserver:self forKeyPath:@"categoryName"];
}


@end
