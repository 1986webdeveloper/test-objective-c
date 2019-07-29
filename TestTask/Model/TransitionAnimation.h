//
//  TransitionAnimation.h
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TransitionAnimation : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic,weak) UIView *cellView;
@property (nonatomic,assign) CGRect cellFrame;
-(id)initWithCustomView:(UIView *)view withFrame:(CGRect )frame;
@end

NS_ASSUME_NONNULL_END
