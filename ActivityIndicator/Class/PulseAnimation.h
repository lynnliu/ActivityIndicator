//
//  PulseAnimation.h
//  ActivityIndicator
//
//  Created by Lynn on 10/22/15.
//  Copyright © 2015 Lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationHeader.h"

@interface PulseAnimation : NSObject

-(void)setupAnimationInLayer:(CALayer *)layer size:(CGFloat)size color:(UIColor *)tintColor;

@end
