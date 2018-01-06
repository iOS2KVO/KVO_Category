//
//  ClassController.m
//  KVO_Category
//
//  Created by  ZhuHong on 2017/12/31.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import "ClassController.h"
#import "KVObject.h"

@interface ClassController ()

/** 属性 */
@property (nonatomic, strong) KVObject* kObj;

@end

@implementation ClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KVObject* kObj = [[KVObject alloc] init];
    kObj.hgName = @"HG";
    NSLog(@"%@", kObj.hgName);
    self.kObj = kObj;
    
    // 添加KVO监听
    [kObj addObserver:self forKeyPath:@"hgName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

// 系统监听KVO变化的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.kObj.hgName = @"CoderHG";
    
    // 不能触发KVO
//    [self.kObj setValue:@"CoderHG" forKey:@"_hgName"];
    
    // 能触发KVO
//    [self.kObj setValue:@"CoderHG" forKey:@"hgName"];
    
    //
    
//    [self.kObj updateHGName];
}


- (void)dealloc {
    // 移除KVO监听
    [self.kObj removeObserver:self forKeyPath:@"hgName"];
}


@end
