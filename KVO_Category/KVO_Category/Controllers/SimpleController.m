//
//  SimpleController.m
//  KVO_Category
//
//  Created by  ZhuHong on 2018/1/6.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "SimpleController.h"
#import "SimpleObject.h"

@interface SimpleController ()

@property (nonatomic, strong) SimpleObject* sObj;

@end

@implementation SimpleController

#pragma mark - lazy
- (SimpleObject *)sObj {
    if (!_sObj) {
        _sObj = [[SimpleObject alloc] init];
    }
    return _sObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 监听
    [self.sObj addKVOforKeyPath:@"hgName" kvoBlock:^(id oldValue, id newValue) {
        NSLog(@"\n旧值 = %@\n新值 = %@", oldValue, newValue);
        
        // 指针循环了
//        NSLog(@"%@", self);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 赋值
    self.sObj.hgName = @"CoderHG";
}


- (void)dealloc {
    NSLog(@"SimpleController ==== dealloc");
}

@end
