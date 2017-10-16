//
//  ViewController.m
//  HTScrollButton
//
//  Created by chenghong on 2017/8/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "ViewController.h"
#import "HTScrollButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HTScrollButton *HTView = [[HTScrollButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    [HTView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)];
    HTView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:HTView];
    
    NSMutableArray *buttonArr = [[NSMutableArray alloc] init];
    // 模拟按钮组
    for (int i = 0; i < 13; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [btn setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:1/255.0 green:174/255.0 blue:202/255.0 alpha:1]];
        [buttonArr addObject:btn];
    }
    
    // 传入按钮组
    [HTView configButtons:buttonArr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
