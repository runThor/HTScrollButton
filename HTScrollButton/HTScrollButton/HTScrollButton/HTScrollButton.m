//
//  HTScrollButton.m
//  HTScrollButton
//
//  Created by chenghong on 2017/8/18.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTScrollButton.h"
#import "HTButtonScrollView.h"

@interface HTScrollButton ()<UIScrollViewDelegate>

@property (nonatomic, strong) HTButtonScrollView *scrollView;
@property (nonatomic, strong) UIButton *leftArrowBtn;  // 左箭头
@property (nonatomic, strong) UIButton *rightArrowBtn;  // 右箭头

@end

@implementation HTScrollButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [[HTButtonScrollView alloc] initWithFrame:CGRectMake(25, 0, self.bounds.size.width - 50, self.bounds.size.height)];
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        // 左箭头
        self.leftArrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, self.frame.size.height/2 - 7.5, 10, 15)];
        [self.leftArrowBtn setBackgroundImage:[UIImage imageNamed:@"leftArrow"] forState:UIControlStateNormal];
        [self.leftArrowBtn addTarget:self action:@selector(leftArrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftArrowBtn];
        self.leftArrowBtn.hidden = YES;
        
        // 右箭头
        self.rightArrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 15, self.frame.size.height/2 - 7.5, 10, 15)];
        [self.rightArrowBtn setBackgroundImage:[UIImage imageNamed:@"rightArrow"] forState:UIControlStateNormal];
        [self.rightArrowBtn addTarget:self action:@selector(rightArrowBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightArrowBtn];
        self.rightArrowBtn.hidden = YES;
    }
    
    return self;
}


// 配置按钮组
- (void)configButtons:(NSArray *)buttons {
    if (buttons.count == 0) {
        return;
    } else if (buttons.count > 5) {
        // 如按钮个数超过一页，则显示右箭头
        self.rightArrowBtn.hidden = NO;
    }
    
    // 将按钮组配置到ScrollView上
    [self.scrollView configButtons:buttons];
}

// 点击左箭头向左翻页
- (void)leftArrowBtnClicked:(UIButton *)btn {
    if (self.scrollView.contentOffset.x < self.scrollView.frame.size.width) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x - self.scrollView.frame.size.width, 0) animated:YES];
    }
}

// 点击右箭头向右翻页
- (void)rightArrowBtnClicked:(UIButton *)btn {
    if ((self.scrollView.contentOffset.x + self.scrollView.frame.size.width) > (self.scrollView.contentSize.width - self.scrollView.frame.size.width)) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, 0) animated:YES];
    }
}


#pragma mark - UIScrollViewDelegate

// 点击箭头滚动完成后调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 如滚动到最左侧，隐藏左箭头
    if (scrollView.contentOffset.x > 0) {
        self.leftArrowBtn.hidden = NO;
    } else {
        self.leftArrowBtn.hidden = YES;
    }
    
    // 如滚动到最右侧，隐藏右箭头
    if ((scrollView.contentSize.width - scrollView.frame.size.width) > scrollView.contentOffset.x) {
        self.rightArrowBtn.hidden = NO;
    } else {
        self.rightArrowBtn.hidden = YES;
    }
}

// 拖拽滚动完成后调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 如滚动到最左侧，隐藏左箭头
    if (scrollView.contentOffset.x > 0) {
        self.leftArrowBtn.hidden = NO;
    } else {
        self.leftArrowBtn.hidden = YES;
    }
    
    // 如滚动到最右侧，隐藏右箭头
    if ((scrollView.contentSize.width - scrollView.frame.size.width) > scrollView.contentOffset.x) {
        self.rightArrowBtn.hidden = NO;
    } else {
        self.rightArrowBtn.hidden = YES;
    }
}


@end
