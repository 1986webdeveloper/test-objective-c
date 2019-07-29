//
//  AppDetailViewController.h
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppObj.h"
#import "todayAppCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppDetailViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIView *vwMainView;
@property (weak, nonatomic) IBOutlet UIImageView *imgAppImage;
@property (weak, nonatomic) IBOutlet UILabel *lblAppName;
@property (weak, nonatomic) AppObj *appObj;
@property (assign, nonatomic) CGRect imageFrame;
@property (weak, nonatomic) IBOutlet UIView *vwContainerView;
@property (strong, nonatomic) UIView *snapshotView;
@property (assign, nonatomic) BOOL statusBarHidden;
@property (weak, nonatomic) id <AppDetailDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
