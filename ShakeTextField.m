//
// Created by Mustafin Askar on 16/09/2014.
// Copyright (c) 2014 Crystal Spring. All rights reserved.
//

#import "ShakeTextField.h"


@implementation ShakeTextField {

}

- (void)shakeX {
    [self shakeXWithOffset:5.0 breakFactor:0.3 duration:1.5 maxShakes:5];
}

- (void)shakeXWithOffset:(CGFloat)aOffset breakFactor:(CGFloat)aBreakFactor
                duration:(CGFloat)aDuration maxShakes:(NSInteger)maxShakes {

    CAKeyframeAnimation *animation =
            [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setDuration:aDuration];

    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:20];
    int infinitySec = maxShakes;
    while(aOffset > 0.01) {
        [keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x - aOffset, self.center.y)]];
        aOffset *= aBreakFactor;
        [keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x + aOffset, self.center.y)]];
        aOffset *= aBreakFactor;
        infinitySec--;
        if(infinitySec <= 0) {
            break;
        }
    }

    animation.values = keys;

    [self.layer addAnimation:animation forKey:@"position"];
}

@end