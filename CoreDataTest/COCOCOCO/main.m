//
//  main.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/2.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
      
        int index =  UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"+++++++++++++++");
        return index;
        
      
//        void *atautoreleasepoolobj = objc_autoreleasePoolPush();
//        // 用户代码，所有接收到 autorelease 消息的对象会被添加到这个 autoreleasepool 中
//        objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
   
    return 0;
  
}
