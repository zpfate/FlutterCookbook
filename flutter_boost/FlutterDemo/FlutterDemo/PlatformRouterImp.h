//
//  PlatformRouterImp.h
//  FlutterDemo
//
//  Created by Twisted Fate on 2021/5/26.
//

#import <Foundation/Foundation.h>
#import <FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN
@interface PlatformRouterImp : NSObject<FLBPlatform>

@property (nonatomic,strong) UINavigationController *navigationController;

@end


NS_ASSUME_NONNULL_END
