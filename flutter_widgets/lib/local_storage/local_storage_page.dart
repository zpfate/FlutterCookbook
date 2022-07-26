import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/local_storage/file_util.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class LocalStoragePage extends StatelessWidget {
  const LocalStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: defaultAppBar(title: "本地化持久"),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClickSection(sectionBean: _getFileSectionBean()),
            ClickSection(sectionBean: _getSharedPreferencesSectionBean()),
            ClickSection(sectionBean: _getDatabaseSectionBean()),
          ],
        ),
      ),
    );
  }


  /// 读取SharedPreferences中key为counter的值
  Future _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0); return counter;
  }
  /// 递增写入SharedPreferences中key为counter的值
  Future _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1; prefs.setInt('counter', counter);
  }

  /// 新建数据库
  Future<Database> database = openDatabase(
    ,
  );


  /// 文件管理
  SectionBean _getFileSectionBean() {
    return SectionBean(
        widgetBean: WidgetBean(
          title: "File",
        ),
        list: [
          WidgetBean(
            title: "创建文件目录",
            onPressed: () {
              FileUtil.makeLocalFile();
              },
          ),
          WidgetBean(
            title: "写入",
            onPressed: () {
              FileUtil.write(content: "content");
            },
          ),
          WidgetBean(
            title: "读取",
            onPressed: () {
              FileUtil.readContent();
            },
          ),
        ]
    );
  }

  /// SharedPreference
  SectionBean _getSharedPreferencesSectionBean() {
    return SectionBean(
        widgetBean: WidgetBean(
          title: "SharedPreference",
        ),
        list: [
          WidgetBean(
            title: "写入",
            onPressed: () {
              _incrementCounter();
            },
          ),

          WidgetBean(
            title: "读取",
            onPressed: () {
              _loadCounter();
            },
          ),
        ]
    );
  }

  /// 数据库
  SectionBean _getDatabaseSectionBean() {
    return SectionBean(
        widgetBean: WidgetBean(
          title: "Database",
        ),
        list: [
          WidgetBean(
            title: "打开数据库",
            onPressed: () {
              _incrementCounter();
            },
          ),

          WidgetBean(
            title: "插入数据",
            onPressed: () {
              _loadCounter();
            },
          ),

          WidgetBean(
            title: "读取数据",
            onPressed: () {
              _loadCounter();
            },
          ),
        ]
    );
  }
}
