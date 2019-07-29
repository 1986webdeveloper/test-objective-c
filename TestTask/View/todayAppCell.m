//
//  todayAppCell.m
//  TestTask
//
//  Created by AGC on 24/07/19.
//  Copyright © 2019 AGC. All rights reserved.
//

#import "todayAppCell.h"



@implementation todayAppCell
@synthesize appObj,vwMainView,lblAppName,imgAppImage,delegate,isAnimationComplete,isTouchEnd,touchFrame;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configure {
    lblAppName.text = appObj.title;
    imgAppImage.image = [UIImage imageNamed:appObj.imageName];
    vwMainView.layer.cornerRadius = 15;
    vwMainView.layer.masksToBounds = true;
    vwMainView.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    vwMainView.layer.shadowOffset = CGSizeMake(0, 2);
    vwMainView.layer.shadowRadius = 10;
    vwMainView.layer.shadowOpacity = 0.7;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    isTouchEnd = false;
    isAnimationComplete = false;
    touchFrame = [self convertRect:self.vwMainView.frame toView:self.superview];
    self.vwMainView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.2 animations:^{
        self.vwMainView.transform = CGAffineTransformScale(self.vwMainView.transform, 0.95, 0.95);
    } completion:^(BOOL finished) {
        self.isAnimationComplete = true;
        if (self.isTouchEnd == true) {
            [self.delegate goToAppDetail:self.contentView.tag];
        }
    }];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    isTouchEnd = false;
    [UIView animateWithDuration:0.5 animations:^{
        self.vwMainView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    isTouchEnd = true;
    if (self.isAnimationComplete == true) {
        [self.delegate goToAppDetail:self.contentView.tag];
    } else {
        
    }
}

@end
