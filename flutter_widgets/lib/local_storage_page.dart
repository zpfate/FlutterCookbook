import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          ],
        ),
      ),
    );
  }



  /// 创建文件目录
  Future<File>  _localFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    logUtil(message: "documentPath = $path");
    return File('$path/context.txt');
  }

  /// 写入
  Future<File> _writeContent(String content) async {
    final file = await _localFile();
    file.writeAsString(content);
    return file;
  }

  /// 读取
  Future<String> _readContent() async {
    try {
      final file = await _localFile();
      String contents = await file.readAsString();
      logUtil(message: "read success, string = $contents");
      return contents;
    } catch (e) {
      return "read failed";
    }
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
  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'students_database.db'),
      onCreate: (db, version)=>db.execute("CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, score INTEGER)"),
  onUpgrade: (db, oldVersion, newVersion){
  //dosth for migration
  },
  version: 1,
  );

  SectionBean _getFileSectionBean() {
    return SectionBean(
        widgetBean: WidgetBean(
          title: "File",
          onPressed: ()=> {},
        ),
        list: [
          WidgetBean(
            title: "创建文件目录",
            onPressed: () {
              _localFile();
            },
          ),
          WidgetBean(
            title: "写入",
            onPressed: () {
              _writeContent("content");
            },
          ),
          WidgetBean(
            title: "读取",
            onPressed: () {
              _readContent();
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
          onPressed: () {},
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
          onPressed: () {},
        ),
        list: [
          WidgetBean(
            title: "打开数据库",
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
}
