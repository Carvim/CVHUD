//
//  CVHUD.h
//  Kids
//
//  Created by apple on 15-9-18.
//  Copyright (c) 2015年 SherrySorftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface CVHUD : UIView


typedef NS_ENUM(NSInteger, CV_HUD_UserInteractionEnabledtype) {
    BackgroundViewUserInteractionEnabled_NO = 0,
    BackgroundViewUserInteractionEnabled_YES,
    BackgroundViewTapToSetDissmiss
};

@property (strong,nonatomic) UIWindow * HUDWindow;
//+(CVHUD*)show;
+ (CVHUD*)dissmiss;
+ (CVHUD*)showHUDWithType:(CV_HUD_UserInteractionEnabledtype)type;
+ (CVHUD*)ShowError;
+ (CVHUD*)ShowSuccess;
+ (CVHUD*)ShowSuccessWithTips:(NSString*)string;
+ (CVHUD*)ShowErrorWithTips:(NSString*)string;
@end
