//
//  XmlToFlutterConverter.h
//  XMLToFlutterConverter
//
//  Created by fate on 2023/6/2.
//

#import <Cocoa/Cocoa.h>

@interface XmlToFlutterConverter : NSObject <NSXMLParserDelegate>

+ (NSString *)convertToFlutterCode:(NSString *)xmlString;

@end
