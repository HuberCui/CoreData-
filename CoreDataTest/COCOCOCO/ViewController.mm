//
//  ViewController.m
//  COCOCOCO
//
//  Created by Xuebin Cui on 2018/4/2.
//  Copyright © 2018年 Xuebin Cui. All rights reserved.
//

#import "ViewController.h"
//#import "MMViewController.swift"
#import <objc/objc-sync.h>
#include <sys/types.h>
#import "SecViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *sourceArray_m;
@property (nonatomic,strong) NSLock* lock;
@property (nonatomic,strong)UIView *vv;
@property (nonatomic,strong) SecViewController *sec;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
    butn.backgroundColor  = [UIColor redColor];
    butn.frame = CGRectMake(100, 100, 50, 30);
    SEL sel = @selector(operationUse);
    [butn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn];
    
    UIButton *butn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    butn1.backgroundColor  = [UIColor redColor];
    butn1.frame = CGRectMake(100, 200, 50, 30);
    SEL sel1 = @selector(next);
    [butn1 addTarget:self action:sel1 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn1];
    // Do any additional setup after loading the view, typically from a nib.
   // [self GCDbarrier];
  //  [self lockUse];
 
    
}
-(void)dealloc{
    NSLog(@"---");
}
-(void)next{
    SecViewController *vc = [[SecViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)operationUse{
}
@end
