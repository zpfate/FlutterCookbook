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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              "测试zcrzcr",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),

            // Text("这是16号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "HM-Md"), textScaleFactor: 1,),
            // Text("这是17号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17, fontFamily: "HM-Md"), textScaleFactor: 1,),
            // Text("这是18号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "HM-Md"), textScaleFactor: 1,),
            // Text("这是19号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 19, fontFamily: "HM-Md"), textScaleFactor: 1,),
            Text("Recommend", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "HM-Bold"), textScaleFactor: 1,),
            Text(
              "测试zcrzcr",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),
            Text(
              "测试zcrzcr",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),
            Text(
              "测试zcrzcr",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "HM-Md"),
              textScaleFactor: 1,
            ),
            // Text("这是21号粗体", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 21, fontFamily: "HM-Md"), textScaleFactor: 1,),
          ],
        ),
      ),
    );
  }
}
