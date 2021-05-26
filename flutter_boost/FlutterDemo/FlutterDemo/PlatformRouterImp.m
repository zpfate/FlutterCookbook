//
//  PlatformRouterImp.m
//  FlutterDemo
//
//  Created by Twisted Fate on 2021/5/26.
//

#import "PlatformRouterImp.h"
#import <UIKit/UIKit.h>

@implementation PlatformRouterImp

- (void)open:(nonnull NSString *)url urlParams:(nonnull NSDictionary *)urlParams exts:(nonnull NSDictionary *)exts completion:(nonnull void (^)(BOOL))completion {
    
    
    NSLog(@"flutter跳转native的url %@",url);
        
        if ([url isEqualToString:@"native"]) {
            [self openNativeVC:url urlParams:urlParams exts:exts];
            NSLog(@"platformRouterImp");
            return;
        }
        BOOL animated = [exts[@"animated"] boolValue];
        FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
        [vc setName:url params:urlParams];
        [urlParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            NSLog(@"key:%@",key);
            NSLog(@"obj:%@",obj);
        }];
        [self.navigationController pushViewController:vc animated:animated];
        if (completion) {
            completion(YES);
        }
}

- (void)openNativeVC:(NSString *)name urlParams:(NSDictionary *)params exts:(NSDictionary *)exts{

    UIViewController *vc = [[UIViewController alloc] initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
    BOOL animated = [exts[@"animated"] boolValue];
    if ([params[@"present"] boolValue]) {
        [self.navigationController presentViewController:vc animated:animated completion:^{

        }];
    }else{
        [self.navigationController pushViewController:vc animated:animated];
    }
}

@end
