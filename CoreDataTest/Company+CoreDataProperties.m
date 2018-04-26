//
//  Company+CoreDataProperties.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/9.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//
//222

#import "Company+CoreDataProperties.h"

@implementation Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Company"];
}

@dynamic name;
@dynamic door;
@dynamic student;

@end
