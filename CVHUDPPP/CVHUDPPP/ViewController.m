//
//  ViewController.m
//  CVHUDPPP
//
//  Created by apple on 15-9-18.
//  Copyright (c) 2015年 SherrySorftware. All rights reserved.
//

#import "ViewController.h"
#import "CVHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)type0:(id)sender {
    [CVHUD showHUDWithType:0];
}
- (IBAction)type1:(id)sender {
    [CVHUD showHUDWithType:1];
}
- (IBAction)type2:(id)sender {
    [CVHUD showHUDWithType:2];
}

- (IBAction)dissmiss:(id)sender {
    [CVHUD dissmiss];
}
- (IBAction)showError:(id)sender {
    [CVHUD ShowError];
}

- (IBAction)showSuccess:(id)sender {
    [CVHUD ShowSuccess];
}
- (IBAction)showErrorString:(id)sender {
    [CVHUD ShowErrorWithTips:@"反正错了就是错了"];
}
- (IBAction)showSuccessString:(id)sender {
    [CVHUD ShowSuccessWithTips:@"成功了亲我一个咩"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
