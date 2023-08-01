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
    class name extends StatelessWidget {\n\
        const ({super.key});\n\
        $filedList\n\
        @override\n\
        Widget build(BuildContext context) {\n\
            return $child;\n\
        }\n\
        $methodList\n\
    }";
    return [widgetStr stringByReplacingOccurrencesOfString:@"name" withString:name];
}

@end
