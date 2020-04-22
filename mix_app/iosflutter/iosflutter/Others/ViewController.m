//
//  ViewController.m
//  iosflutter
//
//  Created by wangjiawei on 2020/4/21.
//  Copyright © 2020 wangjiawei. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoostPlugin.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];

    // Make a button to call the showFlutter function when pressed.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(pushFlutterPage:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"pushFlutterPage!" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.blueColor;
    button.frame = CGRectMake(80.0, 110.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
               action:@selector(present:)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"present Flutter!" forState:UIControlStateNormal];
    button2.backgroundColor = UIColor.blueColor;
    button2.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button2];
}

- (void)pushFlutterPage:(id)sender {
    [FlutterBoostPlugin open:@"first" urlParams:@{kPageCallBackId:@"MycallbackId#1"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
        NSLog(@"call me when page finished, and your result is:%@", result);
    } completion:^(BOOL f) {
        NSLog(@"page is opened");
    }];
}

- (void)present:(id)sender {
    [FlutterBoostPlugin open:@"second" urlParams:@{@"present":@(YES),kPageCallBackId:@"MycallbackId#2"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
        NSLog(@"call me when page finished, and your result is:%@", result);
    } completion:^(BOOL f) {
        NSLog(@"page is presented");
    }];
}



@end
