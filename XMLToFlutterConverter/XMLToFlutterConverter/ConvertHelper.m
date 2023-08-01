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

+ (NSString *)convertType:(NSDictionary *)attributes {
    if (typeDictionary == nil) {
        typeDictionary = @{
            @"string" : @"String",
            @"int" : @"int",
            @"double" : @"double",
            @"float" : @"float",
            @"num" : @"num"
        };
    }
    
    NSString *typeKey = attributes[@"type"];
    NSString *type = typeDictionary[typeKey];
    NSString *name = attributes[@"name"];
    NSString *value = attributes[@"value"];
    if (value.length == 0) {
        value = @"\'\'";
    }
    return [NSString stringWithFormat:@"%@ %@ = %@;", type, name, value];
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

+ (NSString *)convertFunction:(NSDictionary *)attributes {
    NSString *functionName = attributes[@"name"];
    return [NSString stringWithFormat:@"\
    void %@() {\n\
        $functionBody\n\
    }\n", functionName];
}

+ (NSString *)convertButton:(NSDictionary *)attrs {
    return @"";
}

@end
