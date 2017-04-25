//
//  MBProgressCustomView.m
//  DigitalSense
//
//  Created by baolicheng on 16/8/2.
//  Copyright © 2016年 RenRenFenQi. All rights reserved.
//

#import "MBProgressCustomView.h"

@implementation MBProgressCustomView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setBackgroundColor:[UIColor clearColor]];
//        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"load_circle.png"]];
//        [self addSubview:_imageView];
        
//        [self addAnimation];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *circleLoadImage = [UIImage imageNamed:@"load_circle.png"];
        _imageView = [[UIImageView alloc] initWithImage:circleLoadImage];
        [self addSubview:_imageView];
        [self setFrame:CGRectMake(0, 0, circleLoadImage.size.width, circleLoadImage.size.height)];
        [_imageView setFrame:CGRectMake(0, 0, circleLoadImage.size.width, circleLoadImage.size.height)];
        
        [self addAnimation];
    }
    return self;
}

-(void)addAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 10.0f;
    rotationAnimation.delegate = self;
    
    [_imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)removeFromSuperview
{
    [super removeFromSuperview];
    [_imageView.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self addAnimation];
    }
}
@end
