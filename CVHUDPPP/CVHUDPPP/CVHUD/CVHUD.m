//
//  CVHUD.m
//  Kids
//
//  Created by apple on 15-9-18.
//  Copyright (c) 2015年 SherrySorftware. All rights reserved.
//

#import "CVHUD.h"

@implementation CVHUD
@synthesize HUDWindow;
static CVHUD * singleHUD = nil;
//+(CVHUD*)show {
//    [CVHUD makeSinge];
//    [singleHUD makeAWindow];
//    [singleHUD showImages];
//    return nil;
//}

+(CVHUD*)makeSinge {
    @synchronized (self) {
        if (singleHUD == nil) {
            singleHUD = [[self alloc]init];
        }
    }
    return singleHUD;
}

+(CVHUD*)showHUDWithType:(CV_HUD_UserInteractionEnabledtype)type {
    [CVHUD makeSinge];
    switch (type) {
        case 0: {
            //[singleHUD dissmisssss];
            [singleHUD makeAWindow];
            [singleHUD showImages];
        }
            break;
        case 1: {
            [singleHUD makeALittleWindow];
            [singleHUD showLittleWindowImages];
        }break;
        case 2: {
            [singleHUD makeAWindow:YES];
            [singleHUD showImages];
        }break;
        default:
            break;
    }
    return nil;
}

+(CVHUD*)dissmiss {
    [singleHUD dissmisssss];
    return nil;
}

- (void)makeAWindow {
    HUDWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    HUDWindow.windowLevel     = UIWindowLevelAlert;
    HUDWindow.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    [HUDWindow makeKeyAndVisible];
}

- (void)makeAWindow:(BOOL)backgroundDissmiss {
    HUDWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    HUDWindow.windowLevel     = UIWindowLevelAlert;
    HUDWindow.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    [HUDWindow makeKeyAndVisible];

    if (backgroundDissmiss == YES) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissmisssss)];
        [HUDWindow addGestureRecognizer:tap];
    }
    
}

- (void)makeALittleWindow {
    HUDWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2.0, WIDTH/2.0)];
    HUDWindow.windowLevel     = UIWindowLevelAlert;
    HUDWindow.center = CGPointMake(WIDTH/2.0, HEIGHT/3.0);
    [HUDWindow makeKeyAndVisible];
}

- (void)showLittleWindowImages {
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i = 1 ; i < 11; i ++) {
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
    UIImageView * imageView     = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HUDWindow.frame.size.width , HUDWindow.frame.size.height)];
    //imageView.backgroundColor = [UIColor redColor];
    imageView.center            = CGPointMake(HUDWindow.bounds.size.width/2.0, HUDWindow.bounds.size.height/2.0);
    imageView.animationImages   = arr;
    imageView.contentMode       = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 0.5;
    [imageView startAnimating];
    [imageView.layer setMasksToBounds:YES];
    [imageView.layer setCornerRadius:imageView.frame.size.height / 10];
    [HUDWindow addSubview:imageView];
}

- (void)showImages {
    
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i = 1 ; i < 11; i ++) {
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
    UIImageView * imageView     = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HUDWindow.frame.size.width / 2, HUDWindow.frame.size.width / 2)];
    imageView.center            = CGPointMake(HUDWindow.center.x, HEIGHT/3.0);
    //imageView.backgroundColor = [UIColor redColor];
    imageView.animationImages   = arr;
    imageView.contentMode       = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 0.5;
    [imageView startAnimating];
    [imageView.layer setMasksToBounds:YES];
    [imageView.layer setCornerRadius:imageView.frame.size.height / 10];
    [HUDWindow addSubview:imageView];
    
}

+ (CVHUD *)ShowError {
    [CVHUD makeSinge];
    [singleHUD makeAWindow];
    [singleHUD showErrorOrSuccessImage:NO tips:@"失败"];
    return nil;
}

+ (CVHUD *)ShowErrorWithTips:(NSString*)string {
    [CVHUD makeSinge];
    [singleHUD makeAWindow];
    [singleHUD showErrorOrSuccessImage:NO tips:string];
    return nil;
}

+ (CVHUD *)ShowSuccess {
    [CVHUD makeSinge];
    [singleHUD makeAWindow];
    [singleHUD showErrorOrSuccessImage:YES tips:@"成功"];
    return nil;
}

+ (CVHUD *)ShowSuccessWithTips:(NSString*)string {
    [CVHUD makeSinge];
    [singleHUD makeAWindow];
    [singleHUD showErrorOrSuccessImage:YES tips:string];
    return nil;
}

- (void)showErrorOrSuccessImage:(BOOL)state tips:(NSString*)string {
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HUDWindow.frame.size.width / 2, HUDWindow.frame.size.width / 2)];
    imageView.center      = CGPointMake(HUDWindow.center.x, HEIGHT/3.0);
    imageView.image       = state == YES ? [UIImage imageNamed:@"success.jpg"] :[UIImage imageNamed:@"error.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView.layer setMasksToBounds:YES];
    [imageView.layer setCornerRadius:imageView.frame.size.height / 10];
    [HUDWindow addSubview:imageView];
    
    UILabel * state_lab       = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y + imageView.frame.size.height + 10, imageView.frame.size.width, 50)];
    state_lab.backgroundColor = [UIColor whiteColor];
    state_lab.text            = string;
    state_lab.textAlignment   = NSTextAlignmentCenter;
    state_lab.lineBreakMode = 0;
    state_lab.numberOfLines = 0;
    [state_lab sizeToFit];
    state_lab.center = CGPointMake(WIDTH / 2.0, imageView.frame.origin.y + imageView.frame.size.height + state_lab.frame.size.height / 2.0);
    [HUDWindow addSubview:state_lab];
    
    //根据字体来执行自动消失的时间
    float timeMore = string.length * 0.15;
    
    [NSTimer scheduledTimerWithTimeInterval:1 + timeMore target:self selector:@selector(dissmisssss) userInfo:nil repeats:NO];
}

- (void)dissmisssss {
    [HUDWindow resignKeyWindow];
    HUDWindow = nil;
    [singleHUD removeFromSuperview];
    singleHUD = nil;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
