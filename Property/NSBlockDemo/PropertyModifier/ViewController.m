//
//  ViewController.m
//  PropertyModifier
//
//  Created by kenny on 12/12/2017.
//  Copyright © 2017 polarbearmaster. All rights reserved.
//

#import "ViewController.h"

// 为什么block用copy修饰
// 为什么string用copy修饰
@interface ViewController ()
@property (nonatomic, assign) void(^myblock)(void);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // __NSGlobalBlock__ 全局block 存储在代码区
    void(^myBlock1)(void) = ^() {
        NSLog(@"myBlock1");
    };
    
    NSLog(@"%@", myBlock1);
    
    // __NSMallocBlock
    int n = 5;
    void(^myBlock2)(void) = ^() {
        NSLog(@"myBlock2: %d", n);
    };
    NSLog(@"%@", myBlock2);
    
    //__NSMallocBlock__ 堆block 存储在堆区 对栈block做一次copy操作
    void(^myBlock3)(void) = ^() {
        NSLog(@"myBlock3: %d", n);
    };
    NSLog(@"%@", [myBlock3 copy]);
    
    [self test];
    self.myblock();
}

- (void)test {
    int n = 5;
    [self setMyblock:^{
        NSLog(@"%d", n);
    }];
    NSLog(@"test--%@", self.myblock);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
