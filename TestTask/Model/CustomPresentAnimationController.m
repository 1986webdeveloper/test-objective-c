//
//  CustomPresentAnimationController.m
//  TestTask
//
//  Created by Sanjeet on 25/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "CustomPresentAnimationController.h"
#import "AppDetailViewController.h"
#import "TodayAppListViewController.h"
@implementation CustomPresentAnimationController
@synthesize cellView;
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
    
    AppDetailViewController *toViewController = (AppDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVC =  [transitionContext finalFrameForViewController:toViewController];
    UIView *containerView = [transitionContext containerView];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height);
    UIView *snapShot = [cellView snapshotViewAfterScreenUpdates:true];
    snapShot.layer.cornerRadius = 15;
    snapShot.clipsToBounds = true;
    snapShot.frame = self.cellFrame;
    [containerView addSubview:toViewController.view];
    [containerView addSubview:snapShot];
    containerView.frame = finalFrameForVC;
    
    [toViewController.scrollView setHidden:true];
    [toViewController.btnClose setHidden:true];

    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toViewController.view.frame = finalFrameForVC;
        snapShot.frame = toViewController.vwMainView.frame;
        snapShot.layer.cornerRadius = 0;
        self.cellView.layer.cornerRadius = 0;
    } completion:^(BOOL finished) {
        [snapShot removeFromSuperview];
        [transitionContext completeTransition:true];
        [toViewController.scrollView setHidden:false];
        [toViewController.btnClose setHidden:false];
        self.cellView.transform = CGAffineTransformIdentity;
        self.cellView.layer.cornerRadius = 15;
        [self.cellView setHidden:true];
    }];
    
    
}
    
@end
