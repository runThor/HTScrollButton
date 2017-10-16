//
//  HTButtonScrollView.m
//  HTScrollButton
//
//  Created by chenghong on 2017/8/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTButtonScrollView.h"

@interface HTButtonScrollView ()

@property (nonatomic, strong) NSMutableArray *buttonArr;  // 按钮组

@end

@implementation HTButtonScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.pagingEnabled = YES;  // 翻页效果
        self.showsHorizontalScrollIndicator = NO;  
        self.buttonArr = [[NSMutableArray alloc] init];
    }
    
    return self;
}

// 配置按钮
- (void)configButtons:(NSArray *)buttons {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.buttonArr removeAllObjects];
    
    if (buttons.count == 0) {
        return;
    }
    
    // 默认一页5个按钮
    NSInteger pageCount = (buttons.count - 1)/5 + 1;
    CGFloat eachWidth;
    
    if (buttons.count < 5) {
        eachWidth = self.frame.size.width/buttons.count;
        self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    } else if (buttons.count%5 == 0){
        eachWidth = self.frame.size.width/5;
        self.contentSize = CGSizeMake(self.frame.size.width * pageCount, self.frame.size.height);
    } else {
        eachWidth = self.frame.size.width/5;
        self.contentSize = CGSizeMake(self.frame.size.width * (pageCount - 1) + eachWidth * (buttons.count%5), self.frame.size.height);
    }
    
    for (int i = 0; i < buttons.count; i++) {
        CGFloat centerX = self.frame.size.width * (i/5) + i%5 * eachWidth + eachWidth/2;
        CGFloat centerY = self.frame.size.height/2;
        
        UIButton *btn = buttons[i];
        [btn setCenter:CGPointMake(centerX, centerY)];
        [self addSubview:btn];
    }
}



@end
