
import 'package:flutter/material.dart';
import 'package:flutter_widgets/main.dart';
import 'package:flutter_widgets/widgets/route_observer_page.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {

  final PageController _pageController = PageController();
  int _index = 0;

  final _pages = [
    RouteObserverPage(color: Colors.red,),
    RouteObserverPage(color: Colors.green,),
    RouteObserverPage(color: Colors.blue,),
  ];

  final _tabs = [
    BottomNavigationBarItem(
      label: "123", icon: Icon(Icons.add),
    ),
    BottomNavigationBarItem(
      label: "2222", icon: Icon(Icons.add),
    ),
    BottomNavigationBarItem(
      label: "3333", icon: Icon(Icons.add),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items:_tabs,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (index) {

          _pageController.jumpToPage(index);
          setState(() {
            _index = index;

          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(()=> TabbarPage());
        },
      ),
    );
  }

}
