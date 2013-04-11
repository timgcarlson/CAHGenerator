//
//  AppDelegate.m
//  CAHgenerator
//
//  Created by Tim G. Carlson on 4/9/13.
//  Cards Against Humanity is available under a BY-NC-SA 2.0 Creative Commons license.
//

#import "CAHAppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    
    // Splash screen title image to fade out
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Title"]];
    [[self.viewController view] addSubview:imageView];
    [[self.viewController view] bringSubviewToFront:imageView];
    
    [self.window makeKeyAndVisible];
    
    [UIView transitionWithView:self.window duration:3.0f
                       options:UIViewAnimationOptionTransitionNone
                    animations:^(void){imageView.alpha = 0.0f;}
                    completion:^(BOOL finished){[imageView removeFromSuperview];} ];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end