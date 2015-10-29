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
        case 1:
            //[singleHUD dissmisssss];
            [singleHUD makeALittleWindow];
            [singleHUD showLittleWindowImages];
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
    HUDWindow.backgroundColor  = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    [HUDWindow makeKeyAndVisible];
    
    NSLog(@"\n【%@】\n【%@】",HUDWindow,singleHUD);
}

- (void)makeALittleWindow {
    HUDWindow = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, WIDTH / 2.0, WIDTH / 2.0)];
    HUDWindow.center = CGPointMake(WIDTH / 2.0, HEIGHT / 2.0);
    //HUDWindow.backgroundColor  = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    [HUDWindow makeKeyAndVisible];
}

- (void)showLittleWindowImages {
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i = 1 ; i < 11; i ++) {
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HUDWindow.frame.size.width , HUDWindow.frame.size.height)];
    //imageView.backgroundColor = [UIColor redColor];
    imageView.animationImages = arr;
    //按照原始比例缩放图片，保持纵横比
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 0.5;
    //动画的重复次数，想让它无限循环就赋成0
    //imageView.animationRepeatCount = 0;
    //开始动画
    [imageView startAnimating];
    [HUDWindow addSubview:imageView];
}

- (void)showImages {
    
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i = 1 ; i < 11; i ++) {
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HUDWindow.frame.size.width / 2, HUDWindow.frame.size.width / 2)];
    imageView.center = HUDWindow.center;
    //imageView.backgroundColor = [UIColor redColor];
    imageView.animationImages = arr;
    //按照原始比例缩放图片，保持纵横比
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 0.5;
    //动画的重复次数，想让它无限循环就赋成0
    //imageView.animationRepeatCount = 0;
    //开始动画
    [imageView startAnimating];
    [HUDWindow addSubview:imageView];
}

- (void)dissmisssss {
    [HUDWindow resignKeyWindow];
    HUDWindow = nil;
    [singleHUD removeFromSuperview];
    singleHUD = nil;
    NSLog(@"\n【%@】\n【%@】",HUDWindow,singleHUD);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
