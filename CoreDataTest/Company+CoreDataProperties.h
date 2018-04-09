//
//  Company+CoreDataProperties.h
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/9.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//
//

#import "Company+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t door;
@property (nullable, nonatomic, retain) Student *student;

@end

NS_ASSUME_NONNULL_END
