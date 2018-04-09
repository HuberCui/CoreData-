//
//  Student+CoreDataProperties.h
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/9.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) BOOL sex;
@property (nullable, nonatomic, retain) Company *company;

@end

NS_ASSUME_NONNULL_END
