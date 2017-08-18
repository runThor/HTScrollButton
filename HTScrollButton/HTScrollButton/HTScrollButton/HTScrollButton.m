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
        
        // Left Arrow
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


// Config buttons
- (void)configButtons:(NSArray *)buttons {
    if (buttons.count == 0) {
        return;
    } else if (buttons.count > 5) {
        self.rightArrowBtn.hidden = NO;
    }
    
    [self.scrollView configButtons:buttons];
}


- (void)leftArrowBtnClicked:(UIButton *)btn {
    if (self.scrollView.contentOffset.x < self.scrollView.frame.size.width) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x - self.scrollView.frame.size.width, 0) animated:YES];
    }
}


- (void)rightArrowBtnClicked:(UIButton *)btn {
    if ((self.scrollView.contentOffset.x + self.scrollView.frame.size.width) > (self.scrollView.contentSize.width - self.scrollView.frame.size.width)) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, 0) animated:YES];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > 0) {
        self.leftArrowBtn.hidden = NO;
    } else {
        self.leftArrowBtn.hidden = YES;
    }
    
    if ((scrollView.contentSize.width - scrollView.frame.size.width) > scrollView.contentOffset.x) {
        self.rightArrowBtn.hidden = NO;
    } else {
        self.rightArrowBtn.hidden = YES;
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > 0) {
        self.leftArrowBtn.hidden = NO;
    } else {
        self.leftArrowBtn.hidden = YES;
    }
    
    if ((scrollView.contentSize.width - scrollView.frame.size.width) > scrollView.contentOffset.x) {
        self.rightArrowBtn.hidden = NO;
    } else {
        self.rightArrowBtn.hidden = YES;
    }
}


@end
