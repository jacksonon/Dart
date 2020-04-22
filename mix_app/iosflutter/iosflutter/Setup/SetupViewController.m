//
//  SetupViewController.m
//  iosflutter
//
//  Created by wangjiawei on 2020/4/22.
//  Copyright © 2020 wangjiawei. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()
@end

@implementation SetupViewController

- (instancetype)init {
    if (self = [super init]) {
        _flutterContrainer = [[FLBFlutterViewContainer alloc] init];
        [_flutterContrainer setName:@"setup" params:@{}];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
