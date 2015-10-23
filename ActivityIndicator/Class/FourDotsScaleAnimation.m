//
//  FourDotsScaleAnimation.m
//  ActivityIndicator
//
//  Created by Lynn on 10/22/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "FourDotsScaleAnimation.h"

@implementation FourDotsScaleAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor{
    CGFloat marginBetweenDot = 5.0;
    CGFloat dotSize = (size - 2 * marginBetweenDot) / 3;
    
    CAShapeLayer *dot = [[CAShapeLayer alloc] init];
    dot.frame = CGRectMake(0, (size - dotSize)/2, dotSize, dotSize);
    dot.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, dotSize, dotSize)].CGPath;
    dot.fillColor = tintColor.CGColor;
    
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.frame = CGRectMake(0, 0, size, size);
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.instanceCount = 4;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(marginBetweenDot+dotSize, 0, 0);
    
    [replicatorLayer addSublayer:dot];
    [layer addSublayer:replicatorLayer];
    [dot addAnimation:[self scaleAnimation] forKey:@"scaleAnimation"];
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnim = [[CABasicAnimation alloc] init];
    scaleAnim.keyPath = @"transform";
    
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnim.fromValue = [NSValue valueWithCATransform3D: t2];
    CATransform3D t3 = CATransform3DScale(t, 0.2, 0.2, 0.0);
    scaleAnim.toValue = [NSValue valueWithCATransform3D: t3];
    scaleAnim.autoreverses = true;
    scaleAnim.repeatCount = HUGE;
    scaleAnim.duration = 0.3;
    
    return scaleAnim;
}

@end
