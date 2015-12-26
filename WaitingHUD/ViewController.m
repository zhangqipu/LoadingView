//
//  ViewController.m
//  WaitingHUD
//
//  Created by 张齐朴 on 15/12/26.
//  Copyright © 2015年 张齐朴. All rights reserved.
//

#import "ViewController.h"
#import "WaitingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WaitingView *waitingView = [[WaitingView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    waitingView.color = [UIColor greenColor];
    [self.view addSubview:waitingView];
    [waitingView startAnimation];
    
    WaitingView *waitingView1 = [[WaitingView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    waitingView1.color = [UIColor redColor];
    [self.view addSubview:waitingView1];
    [waitingView1 startAnimation];
    
    WaitingView *waitingView2 = [[WaitingView alloc] initWithFrame:CGRectMake(220, 100, 80, 80)];
    waitingView2.speed = 2;
    [self.view addSubview:waitingView2];
    [waitingView2 startAnimation];
    
    WaitingView *waitingView3 = [[WaitingView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    waitingView3.color = [UIColor magentaColor];
    waitingView3.thickness = 0.5;
    [self.view addSubview:waitingView3];
    [waitingView3 startAnimation];
    
    WaitingView *waitingView4 = [[WaitingView alloc] initWithFrame:CGRectMake(0, 0, 190, 190)];
    waitingView4.color = [UIColor magentaColor];
    waitingView4.thickness = 0.5;
    [self.view addSubview:waitingView4];
    waitingView4.center = waitingView3.center;
    [waitingView4 startAnimation];
    
    WaitingView *waitingView5 = [[WaitingView alloc] initWithFrame:CGRectMake(50, 200, 80, 80)];
    waitingView5.color = [UIColor brownColor];
    waitingView5.thickness = 10;
    [self.view addSubview:waitingView5];
    [waitingView5 startAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
