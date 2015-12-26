//
//  WaitingView.h
//  Hello
//
//  Created by zhangqipu on 15/10/31.
//  Copyright © 2015年 zhangqipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingView : UIView

// 颜色
@property (nonatomic, strong) UIColor *color;
// 转动速度
@property (nonatomic, assign) CGFloat speed; // (0 - 100)
// 圆环的粗细
@property (nonatomic, assign) CGFloat thickness;

// 开始动画
- (void)startAnimation;

@end
