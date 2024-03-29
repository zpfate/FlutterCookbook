import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickWidget extends StatelessWidget {
  final WidgetBean widgetBean;
  const ClickWidget({Key? key, required this.widgetBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: ElevatedButton(
        child: Text(widgetBean.title),
        onPressed: () {
          if (widgetBean.page != null) {
            /// 路由跳转
            Get.to(()=> widgetBean.page!, preventDuplicates: false);
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
  final T? page;
  final Function()? onPressed;
  WidgetBean({required this.title, this.page, this.onPressed});
}

class SectionBean {
  String title;
  List<WidgetBean> list;

  SectionBean({required this.title, required this.list});
}
