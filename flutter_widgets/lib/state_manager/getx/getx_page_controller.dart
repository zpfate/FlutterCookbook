import 'package:get/get.dart';

class GetXPageController extends GetxController {
  RxInt count = 0.obs;

  increment() => count++;

  void prepareUpdate() {
    update();
  }
}
