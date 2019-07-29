//
//  todayAppCell.h
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppObj.h"
NS_ASSUME_NONNULL_BEGIN

@protocol AppDetailDelegate
@optional
- (void)goToAppDetail:(NSInteger )tag;
- (void)showTheUnhideMethod;
@end

@interface todayAppCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *vwMainView;
@property (weak, nonatomic) IBOutlet UIImageView *imgAppImage;
@property (weak, nonatomic) IBOutlet UILabel *lblAppName;
@property (weak, nonatomic) AppObj *appObj;
@property (assign, nonatomic) BOOL isAnimationComplete;
@property (assign, nonatomic) BOOL isTouchEnd;
@property (assign, nonatomic) CGRect touchFrame;
@property (weak, nonatomic) id <AppDetailDelegate> delegate;
- (void) configure;
@end

NS_ASSUME_NONNULL_END
