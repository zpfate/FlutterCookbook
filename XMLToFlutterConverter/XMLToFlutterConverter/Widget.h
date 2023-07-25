//
//  Widget.h
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Widget : NSObject

@property (nonatomic, strong) NSString *widgetStr;

- (NSString *)createWidget:(NSDictionary *)attrs;

- (NSString *)value:(NSString *)value;

- (NSString *)convertTextStyle:(nullable NSString *)fontSize fontWeight:(nullable NSString *)fontWeight color:(nullable NSString *)color;

- (NSString *)convertColor:(nullable NSString *)colorString;

- (NSString *)convertFontWeight:(nullable NSString *)fontWeight;

@end

NS_ASSUME_NONNULL_END
