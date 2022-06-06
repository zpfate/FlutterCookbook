//
//  SampleViewFactory.h
//  Runner
//
//  Created by Twisted Fate on 2022/6/6.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

//平台视图封装类
@interface SampleViewControl : NSObject<FlutterPlatformView>

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end


@interface SampleViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject*)messager;

@end

NS_ASSUME_NONNULL_END
