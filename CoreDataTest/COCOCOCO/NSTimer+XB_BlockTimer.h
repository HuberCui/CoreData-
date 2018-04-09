//
//  NSTimer+XB_BlockTimer.h
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/7.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XB_BlockTimer)
+ (NSTimer *)xb_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)(void))block
                                       repeats:(BOOL)repeats;
@end
