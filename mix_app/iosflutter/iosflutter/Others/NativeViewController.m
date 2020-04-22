//
//  NativeViewController.m
//  iosflutter
//
//  Created by wangjiawei on 2020/4/22.
//  Copyright © 2020 wangjiawei. All rights reserved.
//
#import "NativeViewController.h"
#import <flutter_boost/FlutterBoost.h>
#import <Flutter/Flutter.h>

@interface NativeViewController ()
@property(nonatomic, strong) FLBFlutterViewContainer *flutterContrainer;
@end

@implementation NativeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _flutterContrainer = [[FLBFlutterViewContainer alloc] init];
        [_flutterContrainer setName:@"mypage" params:@{}];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
