//
//  UIViewController+Pop.h
//  Robot Control
//
//  Created by xia luzheng on 2019/12/24.
//  Copyright © 2019 LOBOT. All rights reserved.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Pop)
@property (nonatomic, strong) UIButton                 *buttonBackground;
@property (nonatomic, strong) CABasicAnimation         *showAnimation;
@property (nonatomic, strong) CABasicAnimation         *disAnimation;

-(void)presentContent:(UIView *)content animated:(BOOL)flag completion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
