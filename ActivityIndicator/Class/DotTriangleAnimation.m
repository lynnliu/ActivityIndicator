//
//  DotTriangleAnimation.m
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "DotTriangleAnimation.h"

@implementation DotTriangleAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor{
    CGFloat dotSize = size / 4;
    CGFloat transformX = size - dotSize;
    
    CAShapeLayer *dot = [[CAShapeLayer alloc] init];
    dot.frame = CGRectMake(0,0,dotSize,dotSize);
    dot.path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, dotSize, dotSize)].CGPath;
    dot.strokeColor = tintColor.CGColor;
    dot.lineWidth = 1;
    dot.fillColor = [UIColor clearColor].CGColor;
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = CGRectMake(0,0,dotSize,dotSize);
    replicatorLayer.instanceDelay = 0.0;
    replicatorLayer.instanceCount = 3;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, transformX, 0, 0.0);
    transform = CATransform3DRotate(transform, 120.0 * M_PI/180.0, 0.0, 0.0, 1.0);
    replicatorLayer.instanceTransform = transform;
    
    [replicatorLayer addSublayer:dot];
    
    [layer addSublayer:replicatorLayer];
    [dot addAnimation:[self rotationAnimation:transformX] forKey: @"rotateAnimation"];
}

-(CABasicAnimation *)rotationAnimation:(CGFloat)transformX{
    
    CABasicAnimation *rotateAnim = [[CABasicAnimation alloc] init];
    rotateAnim.keyPath = @"transform";
    
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DRotate(t, 0.0, 0.0, 0.0, 0.0);
    
    rotateAnim.fromValue = [NSValue valueWithCATransform3D:t2];
    
    CATransform3D t3 = CATransform3DTranslate(t, transformX, 0.0, 0.0);
    t3 = CATransform3DRotate(t3, 120.0 * M_PI / 180.0, 0.0, 0.0, 1.0);
    
    rotateAnim.toValue = [NSValue valueWithCATransform3D:t3];
    
    rotateAnim.autoreverses = false;
    rotateAnim.repeatCount = HUGE;
    rotateAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotateAnim.duration = 0.8;
    
    return rotateAnim;
}

@end
