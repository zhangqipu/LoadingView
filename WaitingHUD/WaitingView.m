//
//  WaitingView.m
//  Hello
//
//  Created by zhangqipu on 15/10/31.
//  Copyright © 2015年 zhangqipu. All rights reserved.
//

#import "WaitingView.h"

#define kOuterRectWidth (CGRectGetWidth(self.bounds))

@implementation WaitingView
{
    CGPoint center;
    CALayer *gradientLayer;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    if (_color == nil) { // 默认颜色
        _color = [UIColor colorWithRed:51.0 / 255 green:153.0 / 255 blue:255.0 / 255 alpha:1];
    }
    
    if (_speed == 0.0f) { // 默认速度
        _speed = 1.0f;
    }
    
    if (_thickness == 0.0f) { // 默认圆环粗细
        _thickness = 2.0f;
    }
    
    center = CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2);
}

- (void)startAnimation
{
    [self addGradientLayer];
    
    [self clipseGradientLayerToCircle];
    
    [self addAnimation];
}

- (void)addGradientLayer
{
    gradientLayer = [CALayer layer];
    gradientLayer.frame = self.bounds;
    
    [self.layer addSublayer:gradientLayer];

    [self addLeftGradientLayer];
    [self addRightGraidentLayer];
}

- (void)addLeftGradientLayer
{
    CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
    
    leftGradientLayer.frame = CGRectMake(center.x - kOuterRectWidth / 2,
                                         center.y - kOuterRectWidth / 2, kOuterRectWidth / 2, kOuterRectWidth);
    leftGradientLayer.colors = @[(id)_color.CGColor,
                                 (id)[_color colorWithAlphaComponent:0.5].CGColor];
    leftGradientLayer.startPoint = CGPointMake(0, 0);
    leftGradientLayer.endPoint = CGPointMake(0, 1);
    
    [gradientLayer addSublayer:leftGradientLayer];
}

- (void)addRightGraidentLayer
{
    CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
    
    rightGradientLayer.frame = CGRectMake(center.x,
                                          center.y - kOuterRectWidth / 2, kOuterRectWidth / 2, kOuterRectWidth);
    rightGradientLayer.colors = @[(id)[UIColor whiteColor].CGColor,
                                  (id)[_color colorWithAlphaComponent:0.5].CGColor];
    rightGradientLayer.startPoint = CGPointMake(0, 0);
    rightGradientLayer.endPoint = CGPointMake(0, 1);
    
    [gradientLayer addSublayer:rightGradientLayer];
}

- (void)clipseGradientLayerToCircle
{
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    
    circleShapeLayer.frame = self.bounds;
    circleShapeLayer.path = [UIBezierPath bezierPathWithArcCenter:center
                                                           radius:kOuterRectWidth / 2 - _thickness
                                                       startAngle:0
                                                         endAngle:2 * M_PI
                                                        clockwise:NO].CGPath;
    circleShapeLayer.strokeColor = [UIColor blueColor].CGColor;
    circleShapeLayer.fillColor = [UIColor clearColor].CGColor;
    circleShapeLayer.lineWidth = _thickness;
    
    [gradientLayer setMask:circleShapeLayer];
}

- (void)addAnimation
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(2.0 * M_PI);
    rotationAnimation.duration = 1 / _speed;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
