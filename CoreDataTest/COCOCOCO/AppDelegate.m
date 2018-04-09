//
//  AppDelegate.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/2.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <CoreData/CoreData.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  //  [self NSBlockOperationRun];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
  
    self.context = [self coreDataUse:@"company"];
    
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)NSBlockOperationRun{
    NSBlockOperation *blockOper = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperationRun_%@_%@",[NSOperationQueue currentQueue],[NSThread currentThread]);
    }];
    
    [blockOper addExecutionBlock:^{
        NSLog(@"NSBlockOperationRun_2_%@",[NSThread currentThread]);
    }];
    [blockOper addExecutionBlock:^{
        NSLog(@"NSBlockOperationRun_3_%@",[NSThread currentThread]);
    }];
  
    [blockOper start];
}


-(NSManagedObjectContext *)coreDataUse:(NSString *)modelName
{
    /*
* 关联的时候，如果本地没有数据库文件，Ｃoreadata自己会创建
*/

// 1. 上下文
NSManagedObjectContext *context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];

// 2. 上下文关连数据库

// 2.1 model模型文件
NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];

// 2.2 持久化存储调度器
// 持久化，把数据保存到一个文件，而不是内存
NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

// 2.3 设置CoreData数据库的名字和路径
NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
NSString *sqlitePath = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",modelName]];

[store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlitePath] options:nil error:nil];

context.persistentStoreCoordinator = store;
return context;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
