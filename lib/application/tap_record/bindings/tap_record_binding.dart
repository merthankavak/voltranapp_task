import 'package:get/get.dart';

import '../controller/tap_record_controller.dart';

class TapRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TapRecordController>(() => TapRecordController());
  }
}
