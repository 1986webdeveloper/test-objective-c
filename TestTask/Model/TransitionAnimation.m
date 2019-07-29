//
//  TransitionAnimation.m
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "TransitionAnimation.h"
#import "CustomPresentAnimationController.h"
#import "DismissAnimation.h"
@implementation TransitionAnimation
@synthesize cellView,cellFrame;
-(id)initWithCustomView:(UIView *)view withFrame:(CGRect )frame
{
    self = [super init];
    if (self) {
        self.cellView = view;
        self.cellFrame = frame;
    }
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    CustomPresentAnimationController *CustomPresent = [[CustomPresentAnimationController alloc] initWithCustomView:cellView withFrame:self.cellFrame];
    return CustomPresent;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    DismissAnimation *CustomPresent = [[DismissAnimation alloc] initWithCustomView:cellView withFrame:self.cellFrame];
    return CustomPresent;
}

@end
