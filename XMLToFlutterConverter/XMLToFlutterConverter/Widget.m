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

- (NSString *)value:(NSString *)value {
    if (value.length) {
        return value;
    }
    return @"null";
}


- (NSString *)convertTextStyle:(nullable NSString *)fontSize fontWeight:(nullable NSString *)fontWeight color:(nullable NSString *)color {
    
    return [NSString stringWithFormat:@"  TextStyle(\n\
                                color: %@,\n\
                                fontSize: %@,\n\
                                fontWeight: %@,\n\
                              ),", [self convertColor:color], fontSize ?:@"null", [self convertFontWeight:fontWeight]];
}

- (NSString *)convertColor:(nullable NSString *)colorString {
    if (colorString && colorString.length > 0) {
        
        NSString *hexString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        if (hexString.length == 6) {
            return [NSString stringWithFormat:@"Color(0xFF%@)", hexString];
        }
        
        return [NSString stringWithFormat:@"Color(0x%@)", hexString];
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
