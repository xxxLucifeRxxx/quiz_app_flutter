import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class ResultsController extends GetxController with StateMixin {
  late final int countOfCorrectAnswers;
  late final int countOfInCorrectAnswers;
  late final DateTime completed;
  late final int chooseCategory;
  late final String chooseDifficulty;

  final firestoreInstance = FirebaseFirestore.instance;

  @override
  void onInit() async {
    var data = Get.arguments;
    countOfCorrectAnswers = data[0];
    countOfInCorrectAnswers = 10 - countOfCorrectAnswers;
    completed = data[1];
    chooseCategory = data[2];
    chooseDifficulty = data[3];
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void saveResults() {
    firestoreInstance.collection('results').add({
      'category': chooseCategory,
      'difficulty': chooseDifficulty,
      'correct': countOfCorrectAnswers,
      'incorrect': countOfInCorrectAnswers,
      'dateTime': completed,
    }).then((value) {
      Get.snackbar('Успешно', 'Ваш результат сохранен');
      Get.offAllNamed(Routes.HOME);
    });
  }
}
