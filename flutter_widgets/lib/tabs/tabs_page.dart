import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widgets/tabs/tabs_page_controller.dart';
import 'package:get/get.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {

  final TabsPageController tabsPageController = Get.put(TabsPageController());

  @override
  void initState() {
    // TODO: implement initState
    tabsPageController.initData(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabs Page"),),
      body: GetBuilder<TabsPageController>(
        builder: (logic) {
          return Column(
            children: [
              TabBar(
                tabs: tabsPageController.tabs,
                controller: tabsPageController.tabController,),

              Expanded(
                child: PageView.builder(itemBuilder: (context, index) {
                  return TabsSubPage(text: tabsPageController.tabTexts[index]);
            }, itemCount: tabsPageController.tabTexts.length,),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tabsPageController.changeTabs(vsync: this);
        },
      ),
    );
  }
}

class TabsSubPage extends StatefulWidget  {

  final String text;
  const TabsSubPage({super.key, required this.text});

  @override
  State<TabsSubPage> createState() => _TabsSubPageState();
}

class _TabsSubPageState extends State<TabsSubPage> with KeepAliveParentDataMixin{

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("sub page initState");
    debugPrint("sub page initState ---- ${widget.text}");

    // Future.delayed(Duration(seconds: 1), (){
    //   setState(() {
    //     // debugPrint("set State ---- ${widget.text}");
    //
    //     TabsPageController controller = Get.find();
    //     controller.update();
    //   });
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // key:  PageStorageKey(widget.text),
      child: Text(widget.text, style: TextStyle(color: Colors.black),),
    );
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  // TODO: implement keptAlive
  bool get keptAlive => true;
}

