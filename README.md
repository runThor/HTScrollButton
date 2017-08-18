# HTScrollButton
## Show
![demoImg](https://github.com/runThor/HTScrollButton/raw/master/Other/Demo.png)
## Usage
```Objective-C
// ViewController.m

#import "HTScrollButton.h"

HTScrollButton *HTView = [[HTScrollButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    [HTView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)];
    HTView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:HTView];
    
    NSMutableArray *buttonArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 13; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [btn setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:1/255.0 green:174/255.0 blue:202/255.0 alpha:1]];
        [buttonArr addObject:btn];
    }
    
    [HTView configButtons:buttonArr];
```
