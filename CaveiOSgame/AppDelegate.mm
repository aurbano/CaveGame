//
//  AppDelegate.mm
//  Cave iOS game
//
//  Created by Alejandro U. Alvarez on viernes, 17 de mayo de 2013
//  Copyright (c) Alejandro U. Alvarez. All rights reserved.
//

#import "AppDelegate.h"
#import "CodeaViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[CodeaViewController alloc] init];
    
    NSString* projectPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"CaveiOSgame.codea"];
    
    [self.viewController loadProjectAtPath:projectPath];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
