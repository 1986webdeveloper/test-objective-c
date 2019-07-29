//
//  TodayAppListViewController.m
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "TodayAppListViewController.h"
#import "AppObj.h"
#import "todayAppCell.h"
#import "AppDetailViewController.h"
#import "TransitionAnimation.h"
@interface TodayAppListViewController ()

@end

@implementation UIGestureRecognizer (Cancel)

- (void)cancel {
    self.enabled = NO;
    self.enabled = YES;
}

@end

@implementation TodayAppListViewController

@synthesize tlbApp,lblDate,arrAllApp,lpgr,currentItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    arrAllApp = [[NSMutableArray alloc] init];
    [self addAppObject:@"Evolution" andImage:@"Evolution"];
    [self addAppObject:@"Airbnb" andImage:@"Air"];
    [self addAppObject:@"Tappy Meal" andImage:@"tappyMeal"];
    [self addAppObject:@"Alarmy Pro" andImage:@"AlarmyPro"];
    // Do any additional setup after loading the view.
    
    tlbApp.delegate = self;
    tlbApp.dataSource = self;
    tlbApp.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [tlbApp reloadData];
    [self.navigationController setNavigationBarHidden:true];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [tlbApp reloadData];
}

-(void)swipeGeuster:(UISwipeGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"smth1");
            lpgr.cancelsTouchesInView = false;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"smth2");
        default:
            break;
    }
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:self.tlbApp];
    
    NSIndexPath *indexPath = [self.tlbApp indexPathForRowAtPoint:p];
    if (indexPath == nil) {
    } else {
        todayAppCell *cell = (todayAppCell *)[self.tlbApp cellForRowAtIndexPath:indexPath];
        switch ([gestureRecognizer state]) {
            case UIGestureRecognizerStateBegan: {
                [UIView animateWithDuration:0.2 animations:^{
                    cell.vwMainView.transform = CGAffineTransformScale(cell.vwMainView.transform, 0.95, 0.95);
                } completion:^(BOOL finished) {
                    
                }];
                break;
            }
            case UIGestureRecognizerStateEnded: {
                [UIView animateWithDuration:0.2 animations:^{
                    cell.vwMainView.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    
                }];
                break;
            }
            default:
                break;
        }
    }
}

- (void) addAppObject:(NSString *)title andImage:(NSString *)image {
    AppObj *addObj = [[AppObj alloc]init];
    addObj.title = title;
    addObj.imageName = image;
    [arrAllApp addObject:addObj];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrAllApp.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    todayAppCell *cell = (todayAppCell *)[tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    AppObj *appObj = (AppObj *)arrAllApp[indexPath.row];
    cell.appObj = appObj;
    [cell configure];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.tag = indexPath.row;
    cell.delegate = self;
    [cell.vwMainView setHidden:false];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 375;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    todayAppCell *cell = (todayAppCell *)[self.tlbApp cellForRowAtIndexPath:indexPath];
    cell.vwMainView.transform = CGAffineTransformIdentity;
    
}

- (void)goToAppDetail:(NSInteger )tag {
    currentItem = tag;
    AppDetailViewController *appDetail = (AppDetailViewController *) [self.storyboard instantiateViewControllerWithIdentifier:@"AppDetailViewController"];
    appDetail.appObj = (AppObj *)arrAllApp[tag];
    todayAppCell *cell = (todayAppCell *)[self.tlbApp cellForRowAtIndexPath:[NSIndexPath indexPathForRow:tag inSection:0]];
    CGRect frame = [cell convertRect:cell.vwMainView.frame toView:self.view];
    TransitionAnimation *animation = [[TransitionAnimation alloc]initWithCustomView:cell.vwMainView withFrame:frame];
    appDetail.transitioningDelegate = animation;
    CGRect newframe = [cell convertRect:cell.contentView.frame toView:self.view];
    appDetail.imageFrame = CGRectMake(cell.touchFrame.origin.x, newframe.origin.y, cell.touchFrame.size.width, cell.touchFrame.size.height);
    appDetail.delegate = self;
    appDetail.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:appDetail animated:YES completion:nil];
}

- (void)showTheUnhideMethod {
    todayAppCell *cell = (todayAppCell *)[self.tlbApp cellForRowAtIndexPath:[NSIndexPath indexPathForRow:currentItem inSection:0]];
    [cell.vwMainView setHidden:false];
}

@end
