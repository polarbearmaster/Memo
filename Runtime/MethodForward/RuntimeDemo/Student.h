//
//  Student.h
//  RuntimeDemo
//
//  Created by kenny on 12/12/2017.
//  Copyright © 2017 polarbearmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic, copy) NSString *name;

+ (void)learnClass:(NSString *) string;
- (void)goToSchool:(NSString *) name;
@end
