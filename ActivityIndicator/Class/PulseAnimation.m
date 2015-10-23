//
//  PulseAnimation.m
//  ActivityIndicator
//
//  Created by Lynn on 10/22/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "PulseAnimation.h"

@implementation PulseAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor{
    CAShapeLayer *pulse = [[CAShapeLayer alloc] init];
    pulse.frame = CGRectMake(0, 0, size, size);
    pulse.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size, size)].CGPath;
    pulse.fillColor = tintColor.CGColor;
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = CGRectMake(0, 0, size, size);
    replicatorLayer.instanceDelay = 0.5;
    replicatorLayer.instanceCount = 8;
    [replicatorLayer addSublayer:pulse];
    pulse.opacity = 0.0;
    [layer addSublayer:replicatorLayer];
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.animations = @[[self alphaAnimation], [self scaleAnimation]];
    groupAnimation.duration = 4.0;
    groupAnimation.autoreverses = false;
    groupAnimation.repeatCount = HUGE;
    [pulse addAnimation:groupAnimation forKey:@"groupAnimation"];
}

-(CABasicAnimation *)alphaAnimation{
    CABasicAnimation *alphaAnim = [[CABasicAnimation alloc] init];
    alphaAnim.keyPath = @"opacity";
    alphaAnim.fromValue = @(1.0);
    alphaAnim.toValue = @(0.0);
    
    return alphaAnim;
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnim = [[CABasicAnimation alloc] init];
    scaleAnim.keyPath = @"transform";
    
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 0.0, 0.0, 0.0);
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:t2];
    CATransform3D t3 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnim.toValue = [NSValue valueWithCATransform3D:t3];;
    return scaleAnim;
}

@end
