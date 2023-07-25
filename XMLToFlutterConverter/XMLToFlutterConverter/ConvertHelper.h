//
//  ConverterHelper.h
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Widget;
@interface ConvertHelper : NSObject

+ (NSDictionary *)replacedKeyDictionary;

+ (Class)convertClass:(NSString *)widgetName;


+ (NSString *)importFile;


@end

NS_ASSUME_NONNULL_END
