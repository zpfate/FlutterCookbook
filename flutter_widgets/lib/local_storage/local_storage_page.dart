import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/local_storage/file_util.dart';
import 'package:flutter_widgets/local_storage/student.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class LocalStoragePage extends StatelessWidget {
  LocalStoragePage({Key? key}) : super(key: key);

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
  final Future<Database> database = openDatabase(
    "test.db",
    onCreate: (db, version) async {
      await db.execute("CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, score INTEGER)");
    },
    version: 1,
  );

  /// 插入数据
  Future<void> _insertStudent(Student stu) async {
    final Database db = await database;
    /// conflictAlgorithm:冲突策略
    await db.insert("students", stu.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> _updateStudent(Student stu) async {
    final Database db = await database;
    db.update('students', stu.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 查询数据表
  Future<List<Student>> _queryStudents() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("students");
    return List.generate(maps.length, (index) => Student.fromJson(maps[index]));
  }

  /// 文件管理
  SectionBean _getFileSectionBean() {
    return SectionBean(
          title: "File",
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
          title: "SharedPreference",
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


  num idx = 1;
  /// 数据库
  SectionBean _getDatabaseSectionBean() {
    return SectionBean(
          title: "Database",
        list: [
          WidgetBean(
            title: "插入数据",
            onPressed: () async {
              Student stu = Student(id: idx.toString(), name: "张三", score: 100);
              _insertStudent(stu);
              idx++;
            },
          ),

          WidgetBean(
            title: "更新数据",
            onPressed: () {
              Student stu = Student(id: (idx - 1).toString(), name: "李四", score: 100-idx);
              _updateStudent(stu);
            },
          ),

          WidgetBean(
            title: "读取数据",
            onPressed: () async {
              List<Student> list = await _queryStudents();
              for (var element in list) {
                String str = element.toString();
                logUtil(str);
              }
            },
          ),
        ]
    );
  }
}
