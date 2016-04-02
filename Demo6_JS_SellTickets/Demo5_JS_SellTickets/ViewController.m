//
//  ViewController.m
//  Demo5_JS_SellTickets
//
//  Created by  江苏 on 16/3/18.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic)int currentTickets;
@property(nonatomic)int totalTickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalTickets=100;
    NSThread* t1=[[NSThread alloc]initWithTarget:self selector:@selector(sellAction) object:nil];
    t1.name=@"1号窗口";
    [t1 start];
    NSThread* t2=[[NSThread alloc]initWithTarget:self selector:@selector(sellAction) object:nil];
    t2.name=@"2号窗口";
    [t2 start];
    NSThread* t3=[[NSThread alloc]initWithTarget:self selector:@selector(sellAction) object:nil];
    t3.name=@"3号窗口";
    [t3 start];
}
-(void)sellAction{
    while (YES) {
        @synchronized(self) {
            NSString* name=[NSThread currentThread].name;
            NSLog(@"%@开始卖票 %d",name,self.currentTickets+1);
            self.currentTickets++;
            NSLog(@"%@卖票结束 卖掉了%d 还剩%d",name,self.currentTickets,self.totalTickets-self.currentTickets);
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
