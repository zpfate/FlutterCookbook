#import "XmlToFlutterConverter.h"
#import "ConvertHelper.h"
#import "Widget.h"
@interface XmlToFlutterConverter ()

@property(nonatomic, strong) NSMutableArray *widgetStack;

@property(nonatomic, strong) NSMutableString *resultText;

@property(nonatomic, strong) NSMutableString *currentText;

@end

@implementation XmlToFlutterConverter

+ (NSString *)convertToFlutterCode:(NSString *)xmlString {
    XmlToFlutterConverter *converter = [[XmlToFlutterConverter alloc] init];
    [converter parseXML:xmlString];
    return converter.resultText;
}

- (void)parseXML:(NSString *)xmlString {

    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:[xmlString dataUsingEncoding:NSUTF8StringEncoding]];
    xmlParser.delegate = self;
    [xmlParser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"XML parse start ===============================");
    [self.resultText appendString:@"import 'package:flutter/material.dart';\n\n"];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    NSLog(@"XML parse elementName = %@ \n attributes = %@" , elementName, attributeDict.description);
    [_currentText setString:@""];
    NSDictionary *replacedKeyDictionary = [ConvertHelper replacedKeyDictionary];
    NSString *clsName = elementName;
    if ([replacedKeyDictionary.allKeys containsObject:elementName]) {
        clsName = replacedKeyDictionary[elementName];
    }
    Widget *customWidget = [[[ConvertHelper convertClass:clsName] class] new];
    NSString *resultStr = [customWidget createWidget:attributeDict];
    
    
    [self.widgetStack addObject:resultStr];
    
    
    
    if ([elementName isEqualToString:@"Container"]) {
        NSString *color = attributeDict[@"color"];
        [_widgetStack addObject:[NSString stringWithFormat:@"Container(\ncolor: Color(%@),\n", [self parseColor:color]]];
    } else if ([elementName isEqualToString:@"Text"]) {
        NSString *color = attributeDict[@"color"];
        NSString *font = attributeDict[@"color"];
//        [_widgetStack addObject:[NSString stringWithFormat:@"Text(,style:TextStyle(color:Color(%@), font:%@", [self parseColor:color], font]];
        [_widgetStack addObject:@"Text("];
    } else if ([elementName isEqualToString:@"Button"]) {
        NSString *onClick = attributeDict[@"onClick"];
        [_widgetStack addObject:[NSString stringWithFormat:@"GestureDetector(\nonTap:() {\n%@\n},\n", onClick]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSString *lastStr = _widgetStack.lastObject;
    NSMutableString *currentText = [NSMutableString stringWithString:lastStr];
    [currentText appendFormat:@"'%@'", string];
//    currentText replace
    [_widgetStack replaceObjectAtIndex:_widgetStack.count - 1 withObject:currentText];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    /// 取出最下层元素
    NSMutableString *widgetCode = [[NSMutableString alloc] initWithString:[_widgetStack lastObject]];
    /// 取出后删除
    [_widgetStack removeLastObject];
    if ([elementName isEqualToString:@"Text"]) {
        [_currentText appendFormat:@"%@)", widgetCode];
    } else if ([elementName isEqualToString:@"Container"]) {
        NSMutableString *parentWidgetCode = [NSMutableString stringWithString:widgetCode];
        [parentWidgetCode appendFormat:@"child: %@,\n", _currentText];
        [parentWidgetCode appendString:@")"];
        _currentText = parentWidgetCode;
    } else if ([elementName isEqualToString:@"Button"]) {
        NSMutableString *parentWidgetCode = [NSMutableString stringWithString:widgetCode];
        [parentWidgetCode appendFormat:@"child: %@,\n", _currentText];
        [parentWidgetCode appendString:@")"];
        _currentText = parentWidgetCode;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"XML parse ending =============================== ");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XML parse failed == %@", parseError);
}



#pragma mark - Convert Action

- (NSString *)parseColor:(NSString *)colorString {
    if (colorString && colorString.length > 0) {
        NSString *hexString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        
        return [NSString stringWithFormat:@"0xFF%@", hexString];
    }
    return nil;
}



#pragma mark -- Getter

- (NSMutableArray *)widgetStack {
    if (!_widgetStack) {
        _widgetStack = [NSMutableArray array];
    }
    return _widgetStack;
}

- (NSMutableString *)resultText {
    if (!_resultText) {
        _resultText = [NSMutableString string];
    }
    return _resultText;
}

- (NSMutableString *)currentText {
    if (!_currentText) {
        _currentText = [NSMutableString string];
    }
    return _currentText;
}
@end
