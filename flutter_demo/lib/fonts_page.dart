import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontsPage extends StatelessWidget {
  const FontsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harmony字体-Bold'),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text("美股", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "HM-Md"), textScaleFactor: 1),
            // Text("All", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: "HM-Md"), textScaleFactor: 1,),
             SizedBox(
              height: 20,
            ),
            Text(
              "My First Collect",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),
             SizedBox(
              height: 20,
            ),

            Text(
              "我的第一个",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),

            // Text("这是16号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            // Text("这是17号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            // Text("这是18号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            // Text("这是19号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 19.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            // Text("这是20号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            // Text("这是21号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 21.sp, fontFamily: "HM-Bold"), textScaleFactor: 1,),
          ],
        ),
      ),
    );
  }
}
