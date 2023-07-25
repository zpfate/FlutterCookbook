//
//  ElevatedButton.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "TextButton.h"

@implementation TextButton
/**
 ElevatedButton(
           child: Text("审核完成"),
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),                //背景颜色
             foregroundColor: MaterialStateProperty.all(Color(0xff5E6573)),                //字体颜色
             overlayColor: MaterialStateProperty.all(Color(0xffffffff)),                   // 高亮色
             shadowColor: MaterialStateProperty.all( Color(0xffffffff)),                  //阴影颜色
             elevation: MaterialStateProperty.all(0),                                     //阴影值
             textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12)),                //字体
             side: MaterialStateProperty.all(BorderSide(width: 1,color: Color(0xffCAD0DB))),//边框
            
  
             shape: MaterialStateProperty.all(
                 StadiumBorder(
                     side: BorderSide(
                       //设置 界面效果
                       style: BorderStyle.solid,
                       color: Color(0xffFF7F24),
                     )
                 )
             ),//圆角弧度
  
  )
 */
- (NSString *)createWidget:(NSDictionary *)attrs {
    
    NSString *color = attrs[@"color"];
    NSString *bgColor = attrs[@"bgColor"];
    NSString *fontSize = attrs[@"fontSize"];
    NSString *borderRadius = attrs[@"borderRadius"];
    NSString *borderColor = attrs[@"borderColor"];
    NSString *borderWidth = attrs[@"borderWidth"];

    NSString *marginTop = attrs[@"marginTop"];
    NSString *marginBottom = attrs[@"marginBottom"];
    NSString *marginLeft = attrs[@"marginLeft"];
    NSString *marginRight = attrs[@"marginRight"];

    return [NSString stringWithFormat:@"TextButton(\n\
                onPressed: () {},\n\
                child: const Text('$text',),\n\
                style: TextButton.styleFrom(\n\
                padding: const EdgeInsets.only(top: %@, bottom: %@, left: %@, right: %@),\n\
                backgroundColor: %@,\n\
                foregroundColor: %@,\n\
                side: const BorderSide(color: %@, width: %@),\n\
                textStyle: const TextStyle(fontSize: %@),\n\
                shape: RoundedRectangleBorder(\n\
                    borderRadius: BorderRadius.circular(%@),\n\
                    ),\n\
                ),\n\
        )", marginTop?:@"0", marginBottom?:@"0", marginLeft ?:@"0", marginRight?:@"0", [self convertColor:bgColor], [self convertColor:color], [self convertColor:borderColor], borderWidth, fontSize, borderRadius];
}

@end
