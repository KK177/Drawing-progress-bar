//
//  ViewController.m
//  进度条
//
//  Created by MacBook pro on 2020/10/20.
//  Copyright © 2020 MacBook pro. All rights reserved.
//

#import "ViewController.h"
#import "StepProgressView.h"

@interface ViewController ()
@property (nonatomic,strong)StepProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _progressView = [[StepProgressView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    _progressView.index = 0;
    _progressView.titleArray = @[@"代发货",@"已发货",@"已收货",@"待评价"];
    [self.view addSubview:_progressView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _progressView.index = 3;
    
}
@end
