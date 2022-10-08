import 'package:get/get.dart';

class GetXPageController extends GetxController {
  RxInt count = 0.obs;

  increment() => count++;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// count每次更新时调用  比如说购物车+1
    ever(count, (value) {
      print("ever" + value.toString());
    });

    /// count第一次改变的时候调用
    once(count, (value) {
      print("once" + value.toString() + "first");
    });

    /// 停止输入1s后调用
    debounce(count, (value) {
      print("debounce" + value.toString());
    }, time: const Duration(seconds: 1));
  }

  void prepareUpdate() {
    update();
  }
}
