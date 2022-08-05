import 'package:get/instance_manager.dart';

import '../../data/providers/api.dart';
import 'controller.dart';
import 'repository.dart';

class QuizBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController(QuizRepositry(MyApi())));
  }
}