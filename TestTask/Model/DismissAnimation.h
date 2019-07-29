//
//  DismissAnimation.h
//  TestTask
//
//  Created by AGC on 26/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DismissAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UIView *cellView;
@property (nonatomic,assign) CGRect cellFrame;
-(id)initWithCustomView:(UIView *)view withFrame:(CGRect )frame;

@end

NS_ASSUME_NONNULL_END
