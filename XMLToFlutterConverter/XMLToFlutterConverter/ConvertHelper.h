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

+ (NSString *)importFile;

+ (NSDictionary *)replacedKeyDictionary;

+ (NSString *)convertType:(NSString *)string;

+ (NSString *)convertClass:(NSString *)clsName attributes:(NSDictionary *)attributes;

@end

NS_ASSUME_NONNULL_END
