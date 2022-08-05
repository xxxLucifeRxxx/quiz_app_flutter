import 'package:get/route_manager.dart';

import '../app/modules/home/binding.dart';
import '../app/modules/home/page.dart';
import '../app/modules/quiz/binding.dart';
import '../app/modules/quiz/page.dart';
import '../app/modules/results/binding.dart';
import '../app/modules/results/page.dart';
import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.QUIZ, page: () => QuizPage(), binding: QuizBinding()),
    GetPage(name: Routes.RESULTS, page: () => ResultsPage(), binding: ResultsBinding()),
  ];
}
