//
//  DotTriangleAnimation.h
//  ActivityIndicator
//
//  Created by Lynn on 10/23/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationHeader.h"

@interface DotTriangleAnimation : NSObject

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor;

@end
