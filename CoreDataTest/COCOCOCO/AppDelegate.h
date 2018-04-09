//
//  AppDelegate.h
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/2.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/**
 一个数据库对应一个上下文，根据Bundle名创建不同上下文
 */
@property (nonatomic,strong)NSManagedObjectContext *context;
@property (nonatomic,strong)NSManagedObjectContext *context1;
@end

