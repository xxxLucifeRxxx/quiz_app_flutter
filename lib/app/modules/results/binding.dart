import 'package:get/instance_manager.dart';

import 'controller.dart';

class ResultsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ResultsController>(() => ResultsController());
  }
}