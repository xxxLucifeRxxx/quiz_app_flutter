// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/core/utils/percent_size.dart';

import '../../../data/models/questions.dart';
import '../controller.dart';
import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  final Questions question;
  final QuizController controller;
  final String currentQuestion;

  const QuestionCard(
      {required this.question,
      required this.controller,
      required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: 70.0.hp,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(question.question!,
                        style: Theme.of(context).textTheme.headline6),
                    const Spacer(flex: 1),
                    ...List.generate(
                        question.allAnswers!.length,
                        (index) => Column(
                              children: [
                                AnswerOption(
                                    index: index,
                                    currentAnswer: question.allAnswers![index],
                                    controller: controller,
                                    question: currentQuestion,
                                    correctAnswer: question.correctAnswer!,
                                    onPressed: () => controller.checkAnswer(
                                        question,
                                        controller.questions
                                            .where((x) =>
                                                x.question == currentQuestion)
                                            .first
                                            .allAnswers![index])),
                                const SizedBox(height: 15)
                              ],
                            )),
                    const Spacer(flex: 1)
                  ]),
            )));
  }
}
