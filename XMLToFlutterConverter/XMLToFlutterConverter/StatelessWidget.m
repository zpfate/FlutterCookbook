//
//  Component.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "StatelessWidget.h"

@implementation StatelessWidget

- (NSString *)createWidget:(NSDictionary *)attrs {
    NSString *name = attrs[@"name"];
    NSString *widgetStr = @"\
    class name extends StatelessWidget {\
        const ({super.key});\
        @override\
        Widget build(BuildContext context) {\
            return child;\
        }\
    }";
    return [widgetStr stringByReplacingOccurrencesOfString:@"name" withString:name];
}

@end
