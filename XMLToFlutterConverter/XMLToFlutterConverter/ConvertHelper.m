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

+ (NSDictionary *)replacedKeyDictionary {
    return @{
        @"Component" : @"StatelessWidget"
    };
}

+ (Widget *)convertClass:(NSString *)widgetName {
    if (definitionDictionary == nil) {
        definitionDictionary = @{
            @"Button": [TextButton class],
            @"StatelessWidget" : [StatelessWidget class],
        };
    }
    return definitionDictionary[widgetName];
}

+ (NSString *)importFileText {
    return @"import 'package:flutter/material.dart';\n\n;";
}

+ (NSString *)convertButton:(NSDictionary *)attrs {
    return @"";
}

@end
