// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../controller.dart';

class AnswerOption extends StatelessWidget {
  final int index;
  final String currentAnswer;
  final String question;
  final String correctAnswer;
  final QuizController controller;
  final Function() onPressed;

  const AnswerOption({required this.index, required this.currentAnswer, required this.onPressed, required this.controller, required this.question, required this.correctAnswer});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.checkIsQuestionAnswered(question) ? null : onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: controller.getColor(currentAnswer))),
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          text: '${index + 1}. ',
                          style: Theme.of(context).textTheme.headline6,
                          children: [
                            TextSpan(
                              text: currentAnswer,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ]),
                    ),
                  ),
                  if (controller.checkIsQuestionAnswered(question) &&
                      controller.selectAnswer == correctAnswer)
                    Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.getColor(currentAnswer),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            shape: BoxShape.circle),
                        child: Icon(
                          controller.getIcon(currentAnswer),
                          color: Colors.white,
                        ))
                ],)
      ),
    ));
  }
}