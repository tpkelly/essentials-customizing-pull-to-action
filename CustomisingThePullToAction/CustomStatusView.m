//
//  CustomStatusView.m
//  CustomisingThePullToAction
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
// Refresh resource courtesy of VisualPharm ( http://www.visualpharm.com ) via Icon Arcive ( http://www.iconarchive.com ).
//

#import "CustomStatusView.h"

@interface CustomStatusView ()

@property BOOL spin;

@end

@implementation CustomStatusView {
    BOOL _spin;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = NO;
        
        /* Create our refresh image. */
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Refresh"]];
        _icon.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self addSubview:_icon];
    }
    return self;
}

-(void)startSpinning {
    /* Set our spinning flag & start our recursive animation. */
    _spin = YES;
    [self spin360];
}

-(void)spin360 {
    /* Rotate the refresh icon one half circle full over 0.25 seconds, and repeat. */
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.icon.transform = CGAffineTransformRotate(self.icon.transform, M_PI_2);;
    }completion:^(BOOL finished){
        if (finished) {
            if (_spin) {
                [self spin360];
            }
        }
    }];
}

-(void)stopSpinning {
    _spin = NO;
}

#pragma mark - SEssentialsPullToActionStatusView

-(void)updateForPulledAmountChanged:(CGFloat)pulledAmount pullThreshold:(CGFloat)pullThreshold {
    /* Don't do anything when pulled amount changes if our refresh symbols have started spinning. */
    if(!_spin) {
        /* Calculate the fraction of how close we are towards triggering our action. */
        CGFloat pullRatio = pulledAmount / pullThreshold;
        
        /* Calculate the amount we want to rotate our arrows. */
        CGFloat rotationAngle = (M_PI * 2) * pullRatio;
        CGAffineTransform rotate = CGAffineTransformMakeRotation(rotationAngle);
        
        /* Calculate how much we want to scale our arrows, but never increase them larger than their original size. */
        CGFloat scaleRatio = MIN (1, pullRatio);
        CGAffineTransform scale = CGAffineTransformMakeScale(scaleRatio, scaleRatio);

        /* Apply the scale & rotation transformations. */
        _icon.transform = CGAffineTransformConcat(rotate, scale);
    }
}

@end

