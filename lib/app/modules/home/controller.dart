import 'package:get/get.dart';
import 'package:quiz_app_flutter/routes/routes.dart';

import '../../data/enums/difficulty.dart';


class HomeController extends GetxController{
  Rx<String> chooseCategories = 'General Knowledge'.obs;
  Rx<DifficultyEnum> difficulty = DifficultyEnum.easy.obs;

  Future<void> start() async{
    await Get.toNamed(Routes.QUIZ, arguments: [categoriesMap[chooseCategories]!.toInt(), difficulty.toString().split('.').last]);
  }

  Map<String, int> categoriesMap = {
    'General Knowledge': 9,
    'Entertainment: Books': 10,
    'Entertainment: Film': 11,
    'Entertainment: Music': 12,
    'Entertainment: Musicals & Theatres': 13,
    'Entertainment: Television': 14,
    'Entertainment: Video Games': 15,
    'Entertainment: Board Games': 16,
    'Science & Nature': 17,
    'Science: Computers': 18,
    'Science: Mathematics': 19,
    'Mythology': 20,
    'Sports': 21,
    'Geography': 22,
    'History': 23,
    'Politics': 24,
    'Celebrities': 26,
    'Animals': 27,
    'Vehicles': 28,
    'Entertainment: Comics': 29,
    'Science: Gadgets': 30,
    'Entertainment: Japanese Anime & Manga': 31,
    'Entertainment: Cartoon & Animations': 32,
  };
}