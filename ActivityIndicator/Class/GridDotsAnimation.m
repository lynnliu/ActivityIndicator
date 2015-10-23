//
//  GridDotsAnimation.m
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import "GridDotsAnimation.h"

@implementation GridDotsAnimation

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor{
    NSInteger nbColumn = 3;
    CGFloat marginBetweenDot = 5.0;
    
    CGFloat dotSize = (size - (marginBetweenDot * nbColumn)  - 1) / nbColumn;
    
    CAShapeLayer *dot = [[CAShapeLayer alloc] init];
    dot.frame = CGRectMake(0,0,dotSize,dotSize);
    dot.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, dotSize, dotSize)].CGPath;
    dot.fillColor = tintColor.CGColor;
    
    CAReplicatorLayer *replicatorLayerX = [[CAReplicatorLayer alloc] init];
    replicatorLayerX.frame = CGRectMake(0,0,size,size);
    replicatorLayerX.instanceDelay = 0.3;
    replicatorLayerX.instanceCount = nbColumn;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, dotSize+marginBetweenDot, 0, 0.0);
    replicatorLayerX.instanceTransform = transform;
    
    CAReplicatorLayer *replicatorLayerY = [[CAReplicatorLayer alloc] init];
    replicatorLayerY.frame = CGRectMake(0, 0, size, size);
    replicatorLayerY.instanceDelay = 0.3;
    replicatorLayerY.instanceCount = nbColumn;
    CATransform3D transformY = CATransform3DIdentity;
    transformY = CATransform3DTranslate(transformY, 0, dotSize+marginBetweenDot, 0.0);
    replicatorLayerY.instanceTransform = transformY;
    
    [replicatorLayerX addSublayer:dot];
    [replicatorLayerY addSublayer:replicatorLayerX];
    [layer addSublayer:replicatorLayerY];
    
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.animations = @[[self alphaAnimation], [self scaleAnimation]];
    groupAnimation.duration = 1.0;
    groupAnimation.autoreverses = true;
    groupAnimation.repeatCount = HUGE;
    
    [dot addAnimation:groupAnimation forKey:@"groupAnimation"];
}

-(CABasicAnimation *)alphaAnimation{
    CABasicAnimation *alphaAnim = [[CABasicAnimation alloc] init];
    alphaAnim.keyPath = @"opacity";
    alphaAnim.fromValue = @(1.0);
    alphaAnim.toValue = @(0.3);
    return alphaAnim;
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *scaleAnim = [[CABasicAnimation alloc] init];
    scaleAnim.keyPath = @"transform";
    
    CATransform3D t = CATransform3DIdentity;
    CATransform3D t2 = CATransform3DScale(t, 1.0, 1.0, 0.0);
    scaleAnim.fromValue = [NSValue valueWithCATransform3D: t2];
    
    CATransform3D t3 = CATransform3DScale(t, 0.2, 0.2, 0.0);
    scaleAnim.toValue = [NSValue valueWithCATransform3D:t3];
    
    return scaleAnim;
}

@end
