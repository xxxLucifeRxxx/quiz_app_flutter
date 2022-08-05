import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_flutter/app/data/models/questions.dart';

import '../../../routes/routes.dart';
import 'repository.dart';

class QuizController extends GetxController with StateMixin {
  final QuizRepositry repository;
  QuizController(this.repository);

  late PageController pageController;

  final Map<String, bool> _questionIsAnswerd = {};


  bool _isPressed = false;
  bool get isPressed => _isPressed;

  String? _selectAnswer;
  String? get selectAnswer => _selectAnswer;

  String? _correctAnswer;

  int _countOfCorrectAnswers = 0;
  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  double _numberOfQuestion = 1;
  double get numberOfQuestion => _numberOfQuestion;

  late final int chooseCategory;
  late final String chooseDifficulty;

  final questions = <Questions>[].obs;

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    var data = Get.arguments;
    chooseCategory = data[0];
    chooseDifficulty = data[1];
    questions.value = (await repository.api.getQuestions(data[0], data[1]))!;
    resetAnswer();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void checkAnswer(Questions question, String selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = question.correctAnswer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    _questionIsAnswerd.update(question.question!, (value) => true);
    Future.delayed(const Duration(milliseconds: 1000)).then((value) => nextQuestion());
    update();
  }

  void resetAnswer() {
    for (var element in questions) {
      _questionIsAnswerd.addAll({element.question!: false});
    }
    update();
  }

  void nextQuestion() {
    if (pageController.page == questions.length - 1) {
      Get.offAndToNamed(Routes.RESULTS, arguments: [countOfCorrectAnswers, DateTime.now(), chooseCategory, chooseDifficulty]);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  bool checkIsQuestionAnswered(String question) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == question)
        .value;
  }

  Color getColor(String answer) {
    if (_isPressed) {
      if (answer == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answer == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  //het right and wrong icon
  IconData getIcon(String answer) {
    if (_isPressed) {
      if (answer == _correctAnswer) {
        return Icons.done;
      } else if (answer == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }
}