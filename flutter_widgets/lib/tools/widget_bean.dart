import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickWidget extends StatelessWidget {
  final WidgetBean widgetBean;
  const ClickWidget({Key? key, required this.widgetBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Text(
              widgetBean.title,
              style: const TextStyle(color: Colors.white),
            )),
        onTap: () {
          if (widgetBean.page != null) {
            /// 路由跳转
            Get.to(() => widgetBean.page!);
          } else {
            if (widgetBean.onPressed != null) {
              widgetBean.onPressed!();
            }
          }
        },
      ),
    );
  }
}

class ClickSection extends StatelessWidget {
  final SectionBean sectionBean;
  const ClickSection({Key? key, required this.sectionBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var element in sectionBean.list) {
      children.add(ClickWidget(widgetBean: element));
    }
    return Column(
      children: [
        Row(
          children: [
            ClickWidget(widgetBean: WidgetBean(title: sectionBean.title)),
          ],
        ),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Wrap(
              children: children,
            ),
          ],
        ),
      ],
    );
  }
}

class WidgetBean<T extends Widget> {
  final String title;
  final Widget? page;
  final Function()? onPressed;
  WidgetBean({required this.title, this.page, this.onPressed});
}

class SectionBean {
  String title;
  List<WidgetBean> list;

  SectionBean({required this.title, required this.list});
}
