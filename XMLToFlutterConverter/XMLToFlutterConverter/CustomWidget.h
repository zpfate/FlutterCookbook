//
//  CustomWidget.h
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomWidget : NSObject

- (NSString *)createWidget:(NSDictionary *)attrs;


- (NSString *)convertTextStyle:(nullable NSString *)fontSize fontWeight:(nullable NSString *)fontWeight color:(nullable NSString *)color;


@end

NS_ASSUME_NONNULL_END
