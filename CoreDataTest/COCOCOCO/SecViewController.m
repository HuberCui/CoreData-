//
//  SecViewController.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/7.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import "SecViewController.h"
#import "Student+CoreDataClass.h"
#import "Company+CoreDataClass.h"

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface SecViewController ()
{
    AppDelegate *appDelegate;
}

@end

@implementation SecViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    
    [self createBtns];
}

-(void)createBtns
{
    NSArray *butsNameArray = @[@"增",@"删",@"改",@"查"];
    int butW = 50;
    for (int i = 0; i < butsNameArray.count; i++) {
        ///btn name
        NSString * btnName = butsNameArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * butW + 10 * i, 200, butW, butW);
        button.backgroundColor = [UIColor blueColor];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        [button setTitle:btnName forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(clickBtnAction:)
         forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1000 + i;
        [self.view addSubview:button];
    }
}

-(void)clickBtnAction:(UIButton *)btn
{
    NSInteger tag = btn.tag - 1000;
    switch (tag) {
        case 0:
            [self addAction1];       ///增
            break;
        case 1:
            [self deleteAction];    ///删
            break;
        case 2:
            [self updateAction];    ///改
            break;
        case 3:
            [self selectAtion];     ///查
           
        default:
            break;
    }
    
}

-(void)addAction{
    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.context];
    stu.age = arc4random()%15;
    stu.name = [NSString stringWithFormat:@"学生%d",arc4random()%10];
    stu.sex = arc4random()%2 == 0 ? YES:NO;
    
    NSError *err = nil;
    [appDelegate.context save:&err];

}

-(void)addAction1{
    
    for (int i = 0; i<6; i++) {
        
    
    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.context];
    stu.age = arc4random()%15;
    stu.name = [NSString stringWithFormat:@"学生%d",arc4random()%10];
    stu.sex = arc4random()%2 == 0 ? YES:NO;
    
    Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:appDelegate.context];
    company.student = stu;
    company.door = arc4random()%15;
        if (i/2 == 0) {
            company.name = @"iOS";
        }else{
            company.name = @"Android";
        }
     
    
    }
    NSError *err = nil;
    [appDelegate.context save:&err];
}
-(void)selectAtion{
    //获取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    //设置过滤条件--模糊查询（名字包含1的）
//    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name like %@",@"*1"];
//    request.predicate = pre;
    
    // 3. 分页查询
    // 总有共有15数据
    // 每次获取6条数据
    // 第一页 0,6
    // 第二页 6,6
    // 第三页 12,6 3条数据
    // 3.1 分页的起始索引--一般是0
    request.fetchOffset = 1;
    // 3.2 分页的条数
    request.fetchLimit = 6;


    // 4.执行请求
    NSError *error = nil;
    
    NSArray *emps = [appDelegate.context executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error");
    }
    for (Student *stu in emps) {
        NSLog(@"--%@---%d--%@",stu.name,stu.age,stu.company.name);
    }

}
-(void)updateAction{
    // 改变cui的age
    
    // 1.查找到cui
    // 1.1FectchRequest 抓取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    // 1.2设置过滤条件
    // 查找cui
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@", @"cui"];
    request.predicate = pre;
    
    // 1.3执行请求
    NSArray *emps = [appDelegate.context executeFetchRequest:request error:nil];
    
    // 2.更新身高
    for (Student *e in emps) {
        e.age = 2;
    }
    
    // 3.保存
    NSError *error = nil;
    [appDelegate.context save:&error];
    
    if (error) {
        NSLog(@"%@",error);
    }
}
-(void)deleteAction{
    
    // 删除 cui
    
    // 1.查找cui
    // 1.1FectchRequest 抓取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    // 1.2设置过滤条件
    // 查找zhangsan
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@",@"学生0"];
    request.predicate = pre;
    
    // 1.3执行请求
    NSArray *emps = [appDelegate.context executeFetchRequest:request error:nil];
    
    // 2.删除
    for (Student *e in emps) {
        [appDelegate.context deleteObject:e];
    }
    
    // 3.保存
    NSError *error = nil;
    [appDelegate.context save:&error];
    
    if (error) {
        NSLog(@"%@",error);
    }
    
}



@end
