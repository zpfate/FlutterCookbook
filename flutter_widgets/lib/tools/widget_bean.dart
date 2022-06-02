
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';

class WidgetBean {

  final String title;
  final Widget? page;
  final Function()? onPressed;
  WidgetBean({required this.title, this.page, this.onPressed});
}

class SectionBean {

  WidgetBean widgetBean;
  List<WidgetBean> list;

  SectionBean({required this.widgetBean, required this.list});
}

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
            push(context, widgetBean.page!);
          } else {
            widgetBean.onPressed!();
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
    // TODO: implement build

    List<Widget> children = [];
    for (var element in sectionBean.list) {
      children.add(ClickWidget(widgetBean: element));
    }
    return Column(
      children: [
        Row(
          children: [
            ClickWidget(widgetBean: sectionBean.widgetBean),
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
