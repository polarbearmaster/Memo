//
//  Student.m
//  RuntimeDemo
//
//  Created by kenny on 12/12/2017.
//  Copyright © 2017 polarbearmaster. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student
@dynamic name;

#define KEY "name"

- (NSString *)name {
    return objc_getAssociatedObject(self, KEY);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, KEY, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)myClassMethod:(NSString *)string {
    NSLog(@"myClassMethod = %@", string);
}

- (void)myInstanceMethod:(NSString *)string {
    NSLog(@"myInstanceMethod = %@", string);
}

+ (BOOL)resolveClassMethod:(SEL)sel
{
    if (sel == @selector(learnClass:)) {
        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(myClassMethod:)), "v@:");
        return YES;
    }
    return [class_getSuperclass(self) resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(goToSchool:)) {
        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(myInstanceMethod:)), "v@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
