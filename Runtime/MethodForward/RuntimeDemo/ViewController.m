//
//  ViewController.m
//  RuntimeDemo
//
//  Created by kenny on 12/12/2017.
//  Copyright © 2017 polarbearmaster. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *student = [Student new];
    student.name = @"Jack";
    NSLog(@"student name: %@", student.name);
    
    [Student learnClass:@"TOEIC"];
    [student goToSchool:@"Havard"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
