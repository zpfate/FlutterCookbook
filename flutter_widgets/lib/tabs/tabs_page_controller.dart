

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tabs/tabs_page.dart';
import 'package:get/get.dart';

class TabsPageController extends GetxController {

   int index = 0;
  List<String> tabTexts = ["tab1", "tab2", "tab3", "tab4"];

  List<Tab> tabs = [];
  List<Widget> contentWidgets = [];

  bool hasChanged = false;
  late TabController tabController;
   late PageController pageController;

  void initData({required TickerProvider vsync}) {
    initTabs();
    initContentViews();
    tabController = TabController(length: tabTexts.length, vsync: vsync, initialIndex: 0);
    pageController = PageController(initialPage: 0); // 初始化PageController

    tabController.animateTo(0);
    tabController.addListener(() {
      // 同步TabController和PageController
      pageController.jumpToPage(0);
    });

    update();
  }

  void initTabs() {
    tabs.clear();
    for (var tabStr in tabTexts) {
      tabs.add(Tab(
        key: UniqueKey(),
        child: Container(height: 49, child: Text(tabStr, style:const TextStyle(color: Colors.black))),));
    }
  }


  void initContentViews() {
    contentWidgets.clear();
    for (var text in tabTexts) {
      contentWidgets.add(TabsSubPage(text: text, key:  PageStorageKey(text),));
    }
  }

  void changeTabs({required TickerProvider vsync}) {
    // tabTexts.removeLast();
    tabTexts = ["tab2", "tab3", "tab1", "tab4"];

    hasChanged = true;
    initData(vsync: vsync);
  }
}