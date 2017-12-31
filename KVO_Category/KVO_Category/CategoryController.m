//
//  CategoryController.m
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import "CategoryController.h"
#import "NSObject+KVO.h"

@interface CategoryController ()
/** 属性 */
@property (nonatomic, strong) NSObject* kObj;

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSObject* kObj = [[NSObject alloc] init];
    kObj.categoryName = @"categoryName";
    NSLog(@"%@", kObj.categoryName);
    self.kObj = kObj;
    
    // 添加KVO监听
    [kObj addObserver:self forKeyPath:@"categoryName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [kObj addObserver:self forKeyPath:@"extraName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

// 系统监听KVO变化的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@ \n %@", keyPath, change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.kObj.categoryName = @"categoryName_modify";
}



- (void)dealloc {
    // 移除KVO监听
    [self.kObj removeObserver:self forKeyPath:@"categoryName"];
    [self.kObj removeObserver:self forKeyPath:@"extraName"];
}

@end

