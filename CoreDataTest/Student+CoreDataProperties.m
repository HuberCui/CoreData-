//
//  Student+CoreDataProperties.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/9.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic age;
@dynamic name;
@dynamic sex;
@dynamic company;

@end
