//
//  AppDelegate.m
//  ExampleDemo
//
//  Created by ZhangJie on 16/3/22.
//  Copyright © 2016年 zj. All rights reserved.
//

#import "AppDelegate.h"
#import "JBaseAnimationController.h"
#import "SWRevealViewController.h"
#import "JLeftSwipeViewController.h"
#import "JRightSwipeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    JBaseAnimationController *baseAni = [[JBaseAnimationController alloc] init];
    JLeftSwipeViewController *left = [[JLeftSwipeViewController alloc] init];
    // JRightSwipeViewController *right = [[JRightSwipeViewController alloc] init];
    
    SWRevealViewController *sw = [[SWRevealViewController alloc] initWithRearViewController:left frontViewController:baseAni];
    //sw.rightViewController  = right;
    sw.rearViewRevealWidth = 200;
    //sw.rightViewRevealWidth = 200;
    sw.rearViewRevealOverdraw = 0.6;
    
    [sw setFrontViewPosition:FrontViewPositionLeft animated:YES];
    self.window.rootViewController = sw;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
