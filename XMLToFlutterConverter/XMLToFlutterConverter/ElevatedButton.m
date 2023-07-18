//
//  ElevatedButton.m
//  XMLToFlutterConverter
//
//  Created by fate on 2023/7/18.
//

#import "ElevatedButton.h"

@implementation ElevatedButton
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
    
    NSArray *allKeys = attrs.allKeys;
    for (NSString *key in allKeys) {
        
        
    }
    return @"";
}

@end
