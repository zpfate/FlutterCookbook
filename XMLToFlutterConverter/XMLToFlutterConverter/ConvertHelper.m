//
//  ConverterHelper.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "ConvertHelper.h"
#import "Widget.h"
#import "StatelessWidget.h"
#import "TextButton.h"

@implementation ConvertHelper

static NSDictionary *definitionDictionary = nil;

static NSDictionary *typeDictionary = nil;

+ (NSString *)importFile {
    return @"import 'package:flutter/material.dart';\n\n;";
}

+ (NSDictionary *)replacedKeyDictionary {
    return @{
        @"Component" : @"StatelessWidget"
    };
}

+ (NSString *)convertType:(NSString *)string {
    if (typeDictionary == nil) {
        typeDictionary = @{
            @"string" : @"String",
            @"int" : @"int",
            @"double" : @"double",
            @"float" : @"float",
            @"num" : @"num"
        };
    }
    return typeDictionary[string];
}

+ (NSString *)convertClass:(NSString *)clsName attributes:(NSDictionary *)attributes {
    if (definitionDictionary == nil) {
        definitionDictionary = @{
            @"Button": [TextButton class],
            @"StatelessWidget" : [StatelessWidget class],
        };
    }
    /// cls
    Class cls = definitionDictionary[clsName];
    Widget *widget = [cls new];
    NSString *code = [widget createWidget:attributes];
    return code;
}

+ (NSString *)convertButton:(NSDictionary *)attrs {
    return @"";
}

@end
