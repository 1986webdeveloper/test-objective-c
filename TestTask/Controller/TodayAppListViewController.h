//
//  TodayAppListViewController.h
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todayAppCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface TodayAppListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,AppDetailDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tlbApp;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserIcon;

@property (strong, nonatomic) UILongPressGestureRecognizer *lpgr;
@property (strong, nonatomic) NSMutableArray *arrAllApp;
@property (assign, nonatomic) NSInteger currentItem;

@end

NS_ASSUME_NONNULL_END
