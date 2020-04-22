//
//  AppDelegate.m
//  iosflutter
//
//  Created by wangjiawei on 2020/4/21.
//  Copyright © 2020 wangjiawei. All rights reserved.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "PlatformRouterImp.h"


#import "ViewController.h"
#import "NativeViewController.h"

#import "WorkBenchViewController.h"
#import "OnetimePasswordViewController.h"
#import "NewsViewController.h"
#import "SetupViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    PlatformRouterImp *router = [PlatformRouterImp new];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router onStart:^(FlutterEngine *engine) { }];
     
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    ViewController *vc = [[ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
    
    // flutter 页面卡:使用fbvc可以通过name拿到flutter渲染的页面实例
//    FLBFlutterViewContainer *fvc = FLBFlutterViewContainer.new;
//    [fvc setName:@"setup" params:@{}];
//    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil tag:1];
    FLBFlutterViewContainer *setup = [[SetupViewController alloc] init].flutterContrainer;
    setup.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil tag:1];
    setup.navigationItem.title = @"设置";
    
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
    
    // 提供路由跳转使用的navigationController
    router.navigationController = rvc;
    
    tabVC.viewControllers = @[vc,setup];
    
    self.window.rootViewController = rvc;
     
//     UIButton *nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//     nativeButton.frame = CGRectMake(self.window.frame.size.width * 0.5 - 50, 200, 100, 40);
//     nativeButton.backgroundColor = [UIColor redColor];
//     [nativeButton setTitle:@"push native" forState:UIControlStateNormal];
//     [nativeButton addTarget:self action:@selector(pushNative) forControlEvents:UIControlEventTouchUpInside];
//     [self.window addSubview:nativeButton];
//
//     UIButton *pushEmbeded = [UIButton buttonWithType:UIButtonTypeCustom];
//     pushEmbeded.frame = CGRectMake(self.window.frame.size.width * 0.5 - 70, 150, 140, 40);
//     pushEmbeded.backgroundColor = [UIColor redColor];
//     [pushEmbeded setTitle:@"push embeded" forState:UIControlStateNormal];
//     [pushEmbeded addTarget:self action:@selector(pushEmbeded) forControlEvents:UIControlEventTouchUpInside];
//     [self.window addSubview:pushEmbeded];
    
    return YES;
}

- (void)pushNative
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    ViewController *vc = [[ViewController alloc] init];
    [nvc pushViewController:vc animated:YES];
}

- (void)pushEmbeded
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewController *vc = [[NativeViewController alloc] init];
    [nvc pushViewController:vc animated:YES];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
