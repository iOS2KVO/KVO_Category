//
//  ManualController.m
//  KVO_Category
//
//  Created by  ZhuHong on 2018/1/19.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ManualController.h"
#import "ManualObject.h"

@interface ManualController ()

@property (nonatomic, strong) ManualObject* mObj;

@end

@implementation ManualController

- (ManualObject *)mObj {
    if (!_mObj) {
        _mObj = [ManualObject new];
    }
    return _mObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 不能注释
    [self.mObj addObserver:self forKeyPath:@"manual" options:0 context:nil];
    
    NSLog(@"%@", self.mObj);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@, %@", keyPath, change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.mObj.manual = @"123";
}

- (void)dealloc {
    [self.mObj removeObserver:self forKeyPath:@"manual"];
}

@end
