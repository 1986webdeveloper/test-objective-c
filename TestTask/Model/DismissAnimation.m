//
//  DismissAnimation.m
//  TestTask
//
//  Created by AGC on 26/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "DismissAnimation.h"
#import "AppDetailViewController.h"
#import "TodayAppListViewController.h"
@implementation DismissAnimation

-(id)initWithCustomView:(UIView *)view withFrame:(CGRect )frame
{
    self = [super init];
    if (self) {
        self.cellView = view;
        self.cellFrame = frame;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 2.5;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    AppDetailViewController *toVC = (AppDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TodayAppListViewController *fromVC = (TodayAppListViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *snapShot = [self.cellView snapshotViewAfterScreenUpdates:true];
    snapShot.clipsToBounds = true;
    toVC.view.alpha = 0.0;
    [containerView addSubview:snapShot];
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        snapShot.frame = self.cellFrame;
        snapShot.layer.cornerRadius = 15;
    } completion:^(BOOL finished) {
        [snapShot removeFromSuperview];
        [toVC.delegate showTheUnhideMethod];
        [toVC.view removeFromSuperview];
        [fromVC.view setHidden:false];
        [transitionContext completeTransition:true];
    }];
}

@end
