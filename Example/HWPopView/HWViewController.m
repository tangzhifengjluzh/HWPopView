//
//  HWViewController.m
//  HWPopView
//
//  Created by 330200387@qq.com on 12/25/2019.
//  Copyright (c) 2019 330200387@qq.com. All rights reserved.
//

#import "HWViewController.h"
#import <HWPopView/UIViewController+Pop.h>
@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIButton *content = [UIButton buttonWithType:UIButtonTypeCustom];
    [content addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    content.backgroundColor = [UIColor redColor];
    content.frame = CGRectMake(0, 0, 300, 300);
    [self presentContent:content animated:YES completion:^{
        
    }];
}
- (void)click:(UIButton *)sender
{
    if ([sender.superview isKindOfClass:[UIButton class]] && sender.superview.tag == 8888) {
        [sender.superview removeFromSuperview];
    }
}

@end
