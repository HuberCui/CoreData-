//
//  NSProxy+WeakProxy.h
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/7.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy:NSProxy
@property (weak,nonatomic,readonly)id target;
+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;
@end
