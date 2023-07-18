//
//  ConverterHelper.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "ConvertHelper.h"
#import "CustomWidget.h"
#import "StatelessWidget.h"
#import "ElevatedButton.h"
@implementation ConvertHelper

static NSDictionary *definitionDictionary = nil;

+ (NSDictionary *)replacedKeyDictionary {
    return @{
        @"Component" : @"StatelessWidget"
    };
}

+ (CustomWidget *)convertClass:(NSString *)widgetName {
    if (definitionDictionary == nil) {
        definitionDictionary = @{
            @"Button": [ElevatedButton class],
            @"StatelessWidget" : [StatelessWidget class],
        };
    }
    return definitionDictionary[widgetName];
}

+ (NSString *)importFileText {
    return @"import 'package:flutter/material.dart';\n\n;";
}

+ (NSString *)converterButton:(NSDictionary *)attrs {
    return @"";
}

@end
