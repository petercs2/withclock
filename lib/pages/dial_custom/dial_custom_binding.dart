import 'package:get/get.dart';

import 'dial_custom_logic.dart';

class DialCustomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DialCustomLogic(),
      permanent: true,
    );
  }
}
