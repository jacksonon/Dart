//
//  OnetimePasswordViewController.m
//  iosflutter
//
//  Created by wangjiawei on 2020/4/22.
//  Copyright © 2020 wangjiawei. All rights reserved.
//

#import "OnetimePasswordViewController.h"

@interface OnetimePasswordViewController ()

@end

@implementation OnetimePasswordViewController

- (instancetype)init {
    if (self = [super init]) {
        _fbc = [[FLBFlutterViewContainer alloc] init];
        [_fbc setName:@"onetime" params:@{}];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationItem.title = @"动态口令";
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
