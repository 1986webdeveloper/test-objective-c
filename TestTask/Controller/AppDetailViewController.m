//
//  AppDetailViewController.m
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "AppDetailViewController.h"
#import "TransitionAnimation.h"
@interface AppDetailViewController ()

@end

@implementation AppDetailViewController
@synthesize appObj,scrollView,btnClose,lblDescription,vwMainView,imgAppImage,lblAppName,statusBarHidden,vwContainerView,imageFrame;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpData];
    
    scrollView.layer.masksToBounds = true;
    vwMainView.layer.masksToBounds = true;
    vwContainerView.layer.masksToBounds = true;
    // Do any additional setup after loading the view.
    
}

- (void)viewDidLayoutSubviews {
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, lblDescription.frame.origin.y + lblDescription.frame.size.height)];
    vwContainerView.translatesAutoresizingMaskIntoConstraints = true;
    lblDescription.superview.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.contentSize.height);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)setUpData {
    scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    lblAppName.text = appObj.title;
    imgAppImage.image = [UIImage imageNamed:appObj.imageName];
    scrollView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    statusBarHidden = true;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    statusBarHidden = false;
    [self setNeedsStatusBarAppearanceUpdate];
}

-(IBAction)onClickClose:(UIButton *)sender {
    [self dismissVC];
}

-(void)dismissVC {
    TransitionAnimation *animation = [[TransitionAnimation alloc]initWithCustomView:vwMainView withFrame:imageFrame];
    self.transitioningDelegate = animation;
    self.modalPresentationStyle = UIModalPresentationCustom;
    [self.presentingViewController dismissViewControllerAnimated:true completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return statusBarHidden;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.scrollView.superview setBackgroundColor:UIColor.clearColor];
    [self.view setBackgroundColor:UIColor.clearColor];
    CGFloat fixValue = 100;
    if (scrollView.contentOffset.y < -fixValue) {
        [self dismissVC];
    } else if (scrollView.contentOffset.y > 0) {
        scrollView.layer.cornerRadius = 0;
        vwContainerView.layer.cornerRadius = 0;
        self.scrollView.transform = CGAffineTransformIdentity;
        [self.btnClose setHidden:false];
    } else {
        [self.btnClose setHidden:true];
        NSInteger yvalue = fabs(scrollView.contentOffset.y);
        
        CGFloat cornerTemp = (CGFloat)(yvalue) / fixValue;
        CGFloat cornerRadius = 20 * cornerTemp;
        CGFloat scalex = 0.8 + (0.2 * (1 - cornerTemp));
        CGFloat scaley = 0.9 + (0.1 * (1 - cornerTemp));
        
        scrollView.layer.cornerRadius = cornerRadius;
        vwContainerView.layer.cornerRadius = cornerRadius;

        CGAffineTransform transform = CGAffineTransformMakeScale(scalex, scaley);
        self.scrollView.transform = transform;
    }
}

@end
