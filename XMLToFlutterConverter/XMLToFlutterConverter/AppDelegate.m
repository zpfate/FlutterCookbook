//
//  AppDelegate.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/6/5.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    NSString *xmlString = @"<Container color=\"#FF0000\"><Text>Hello, World!</Text></Container>";

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
