//
//  AppDelegate.m
//  HYHotPotForObjective-C
//
//  Created by 韩丛旸 on 2020/12/10.
//

#import "AppDelegate.h"
#import "HYKeyboardManager.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    [self.window setRootViewController:root];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
