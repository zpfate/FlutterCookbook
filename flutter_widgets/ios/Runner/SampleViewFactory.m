//
//  SampleViewFactory.m
//  Runner
//
//  Created by Twisted Fate on 2022/6/6.
//

#import "SampleViewFactory.h"

// 平台视图封装类
@implementation SampleViewControl
{
    UIView * _templcateView;
    
}
//创建原生视图
- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    if ([super init]) {
        _templcateView = [[UIView alloc] init];
        _templcateView.backgroundColor = [UIColor redColor];
        
    }
    return self;
    
}

-(UIView *)view {
    return _templcateView;
}
@end
// 平台视图工厂
@implementation SampleViewFactory
{
    NSObject<FlutterBinaryMessenger>* _messenger;
    
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager {
    if (self = [super init]) {
        _messenger = messager;
    }
    return self;
}

/// 解码器
- (NSObject<FlutterMessageCodec> *)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

// 创建原生视图封装实例
- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    return [[SampleViewControl alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
}

@end
