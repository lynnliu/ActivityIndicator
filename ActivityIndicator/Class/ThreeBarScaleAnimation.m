//
//  ThreeBarScaleAnimation.m
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "ThreeBarScaleAnimation.h"

@implementation ThreeBarScaleAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor{
    CGFloat marginBetweenDot = 5.0;
    CGFloat dotSize = (size - 2 * marginBetweenDot) / 3;
    
    
    CAShapeLayer *dot = [[CAShapeLayer alloc] init];
    dot.frame = CGRectMake((size - dotSize * 3)/2 + dotSize/4 , (size - dotSize * 3)/2, dotSize, dotSize);
    dot.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, dotSize / 2, dotSize * 3)].CGPath;
    dot.fillColor = tintColor.CGColor;
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = CGRectMake(0, 0, size, size);
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(dotSize, 0, 0);
    [replicatorLayer addSublayer:dot];
    
    [layer addSublayer:replicatorLayer];
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.animations = @[[self scaleAnimation],
                                  [self positionAnimation:0 andHeight:dotSize]];
    groupAnimation.duration = 3.0;
    groupAnimation.autoreverses = false;
    groupAnimation.repeatCount = HUGE;
    [dot addAnimation:groupAnimation forKey:@"groupAnimation"];
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnim = [[CABasicAnimation alloc] init];
    scaleAnim.keyPath = @"transform";
    
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnim.fromValue = [NSValue valueWithCATransform3D: t2];
    CATransform3D t3 = CATransform3DScale(t, 1.0, 0.1, 0.0);
    scaleAnim.toValue = [NSValue valueWithCATransform3D: t3];
    scaleAnim.autoreverses = true;
    scaleAnim.repeatCount = HUGE;
    scaleAnim.duration = 0.3;
    
    return scaleAnim;
}

-(CABasicAnimation *)positionAnimation:(CGFloat)y andHeight:(CGFloat)height{
    CABasicAnimation *scaleAnim = [[CABasicAnimation alloc] init];
    scaleAnim.keyPath = @"transform.translation.y";
    
    scaleAnim.fromValue = @(y);
    
    CGFloat y2 = y + 0.9 * height;
    scaleAnim.toValue = @(y2);
    
    scaleAnim.autoreverses = true;
    scaleAnim.repeatCount = HUGE;
    scaleAnim.duration = 0.3;
    
    return scaleAnim;
}



@end
