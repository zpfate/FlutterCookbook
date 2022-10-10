import 'package:get/get.dart';

class GetBuilderControlelr extends GetxController {
  var count1 = 0;
  var count2 = 0;

  void incrementCount1() {
    count1++;
    update(["count1"]);
  }

  void incrementCount2() {
    count2++;
    update();
  }
}
