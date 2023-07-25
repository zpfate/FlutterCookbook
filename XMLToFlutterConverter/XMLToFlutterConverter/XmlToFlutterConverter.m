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
    Widget *customWidget = [[ConvertHelper convertClass:clsName] new];
    NSString *widgetStr = [customWidget createWidget:attributeDict];
    [self.widgetStack addObject:widgetStr];
    
    
    
//    if ([elementName isEqualToString:@"Container"]) {
//        NSString *color = attributeDict[@"color"];
//        [_widgetStack addObject:[NSString stringWithFormat:@"Container(\ncolor: Color(%@),\n", [self parseColor:color]]];
//    } else if ([elementName isEqualToString:@"Text"]) {
//        NSString *color = attributeDict[@"color"];
//        NSString *font = attributeDict[@"color"];
////        [_widgetStack addObject:[NSString stringWithFormat:@"Text(,style:TextStyle(color:Color(%@), font:%@", [self parseColor:color], font]];
//        [_widgetStack addObject:@"Text("];
//    } else if ([elementName isEqualToString:@"Button"]) {
//        NSString *onClick = attributeDict[@"onClick"];
//        [_widgetStack addObject:[NSString stringWithFormat:@"GestureDetector(\nonTap:() {\n%@\n},\n", onClick]];
//    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (![[self class] isBlankString:string]) {
        NSString *lastStr = _widgetStack.lastObject;
        lastStr = [lastStr stringByReplacingOccurrencesOfString:@"$text" withString:string];
        [_widgetStack replaceObjectAtIndex:_widgetStack.count - 1 withObject:lastStr];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    /// 取出最下层元素
//    NSMutableString *widgetCode = [[NSMutableString alloc] initWithString:[_widgetStack lastObject]];
//    /// 取出后删除
//    [_widgetStack removeLastObject];
//    if ([elementName isEqualToString:@"Text"]) {
//        [_currentText appendFormat:@"%@)", widgetCode];
//    } else if ([elementName isEqualToString:@"Container"]) {
//        NSMutableString *parentWidgetCode = [NSMutableString stringWithString:widgetCode];
//        [parentWidgetCode appendFormat:@"child: %@,\n", _currentText];
//        [parentWidgetCode appendString:@")"];
//        _currentText = parentWidgetCode;
//    } else if ([elementName isEqualToString:@"Button"]) {
//        NSMutableString *parentWidgetCode = [NSMutableString stringWithString:widgetCode];
//        [parentWidgetCode appendFormat:@"child: %@,\n", _currentText];
//        [parentWidgetCode appendString:@")"];
//        _currentText = parentWidgetCode;
//    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"XML parse ending =============================== ");
    
    NSInteger index = self.widgetStack.count - 1;
    if (index - 1 >= 0) {
        NSString *childString = self.widgetStack[index];
        NSString *mutableString = [NSMutableString stringWithString:self.widgetStack[index - 1]];
        mutableString = [mutableString stringByReplacingOccurrencesOfString:@"$child" withString:childString];
        [_widgetStack replaceObjectAtIndex:index - 1 withObject:mutableString];
    }
    self.resultText = _widgetStack.firstObject;
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


+ (BOOL)isBlankString:(NSString *)string{
       if (string == nil) {
            return YES;
        }
        if (string == NULL) {
            return YES;
        }
        if ([string isKindOfClass:[NSNull class]]) {
            return YES;
        }
    
    NSString *blankString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([blankString length] == 0) {
            return YES;
        }
    return NO;
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
