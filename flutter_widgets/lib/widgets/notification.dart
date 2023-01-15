
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _msg = "通知：";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Notification"),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_msg),
            const CustomChild(),
          ],
        ),
      ),
    );
  }
}



class CustomNotification extends Notification {
  final String msg;
  CustomNotification(this.msg);
}

class CustomChild extends StatelessWidget {
  const CustomChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          CustomNotification('hi').dispatch(context);

        }, child: const Text('Post Notification')
    );
  }
}
