

import 'package:get/get.dart';

class GetxDemoController extends GetxController {


  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }


  int count = 0;
  void incrementCount() {
    count++;
    update();
  }

}
