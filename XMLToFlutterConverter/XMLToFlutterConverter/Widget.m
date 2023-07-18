//
//  Widget.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "Widget.h"
@implementation Widget

- (NSString *)createWidget:(NSDictionary *)attrs {
    return @"";
}

- (NSString *)convertTextStyle:(nullable NSString *)fontSize fontWeight:(nullable NSString *)fontWeight color:(nullable NSString *)color {
    
    return [NSString stringWithFormat:@"  TextStyle(\
                                color: %@,\
                                fontSize: %@,\
                                fontWeight: %@,\
                              ),", [self convertColor:color], fontSize ?:@"null", [self convertFontWeight:fontWeight]];
}

- (NSString *)convertColor:(nullable NSString *)colorString {
    if (colorString && colorString.length > 0) {
        NSString *hexString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        return [NSString stringWithFormat:@"0xFF%@", hexString];
    }
    return @"null";
}

- (NSString *)convertFontWeight:(nullable NSString *)fontWeight {
    if ([fontWeight isEqualToString:@"bold"]) {
        return @"FontWeight.bold";
    } else if ([fontWeight isEqualToString:@"medium"]) {
        return @"FontWeight.w500";
    } else if ([fontWeight isEqualToString:@"regular"]) {
        return @"FontWeight.normal";
    }
    return @"null";
}


@end
