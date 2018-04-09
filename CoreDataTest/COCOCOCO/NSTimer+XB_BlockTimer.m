//
//  NSTimer+XB_BlockTimer.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/7.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import "NSTimer+XB_BlockTimer.h"

@implementation NSTimer (XB_BlockTimer)
+ (NSTimer *)xb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)(void))block
                                       repeats:(BOOL)repeats{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(xb_blockInvoke:) userInfo:[block copy] repeats:repeats];
}
+ (void)xb_blockInvoke:(NSTimer *)timer {
        void (^block)(void) = timer.userInfo;
    
         if(block) {
                 block();
            }
}
@end
