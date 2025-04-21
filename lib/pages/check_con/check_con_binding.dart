import 'package:get/get.dart';

import 'check_con_logic.dart';

class CheckConBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckConLogic());
  }
}
