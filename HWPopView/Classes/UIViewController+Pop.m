//
//  UIViewController+Pop.m
//  Robot Control
//
//  Created by xia luzheng on 2019/12/24.
//  Copyright © 2019 LOBOT. All rights reserved.
//

#import "UIViewController+Pop.h"
#import <objc/runtime.h>

//#import <AppKit/AppKit.h>

static char buttonBackgroundKey; //那么的key
static char showAnimationKey;
static char disAnimationKey;

@implementation UIViewController (Pop)

- (UIButton *)buttonBackground
{
    return objc_getAssociatedObject(self, &buttonBackgroundKey);
}

- (void)setButtonBackground:(UIButton *)buttonBackground
{
    objc_setAssociatedObject(self, &buttonBackgroundKey, buttonBackground, OBJC_ASSOCIATION_RETAIN);
}

- (CABasicAnimation *)showAnimation
{
    return  objc_getAssociatedObject(self, &showAnimationKey);
}

- (void)setShowAnimation:(CABasicAnimation *)showAnimation
{
    objc_setAssociatedObject(self, &showAnimationKey, showAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CABasicAnimation *)disAnimation
{
    return  objc_getAssociatedObject(self, &disAnimationKey);
}

- (void)setDisAnimation:(CABasicAnimation *)disAnimation
{
    objc_setAssociatedObject(self, &disAnimationKey, disAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)presentContent:(UIView *)content animated:(BOOL)flag completion:(void (^)(void))completion
{
    if (self.buttonBackground == nil) {
        self.buttonBackground = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonBackground.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        self.buttonBackground.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.buttonBackground.tag = 8888;
        [self.buttonBackground addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.buttonBackground.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (flag) {
        [self show:content];
    }
    [self.view addSubview:self.buttonBackground];
    [self.buttonBackground addSubview:content];
    content.center = self.buttonBackground.center;
    completion();
}

- (void)show:(UIView *)view
{
    if (self.showAnimation == nil) {
        CABasicAnimation *theAnimation;
        theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        theAnimation.duration=0.5;
        theAnimation.removedOnCompletion = YES;
        theAnimation.fromValue = [NSNumber numberWithFloat:0.1];
        theAnimation.toValue = [NSNumber numberWithFloat:1];
        self.showAnimation = theAnimation;
    }
    [view.layer addAnimation:self.showAnimation forKey:@"showAnimation"];
}

- (void)dis:(UIView *)view
{
    if (self.disAnimation == nil) {
        CABasicAnimation *theAnimation;
        theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
        theAnimation.duration=0.5;
        theAnimation.removedOnCompletion = YES;
        theAnimation.fromValue = [NSNumber numberWithFloat:1];
        theAnimation.toValue = [NSNumber numberWithFloat:0];
        self.disAnimation = theAnimation;
    }
    [view.layer addAnimation:self.disAnimation forKey:@"disAnimation"];
}
- (void)buttonClick:(UIButton*)button
{
    switch (button.tag) {
        case 8888:
        {
            //            [self dis:self.buttonBackground.subviews.firstObject];
            //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //                            [self.buttonBackground removeFromSuperview];
            //            });
            [self.buttonBackground removeFromSuperview];
            
        }
    }
}
@end
