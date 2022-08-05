// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/core/utils/percent_size.dart';

import '../controller.dart';
import 'question_card.dart';

class QuizBody extends StatelessWidget {
  final QuizController controller;

  const QuizBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.blueAccent),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Question ',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: controller.numberOfQuestion.round().toString(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
                      TextSpan(text: '/', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                      TextSpan(text: '10', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
                    ]
                ))
              ],
            )),
            SizedBox(height: 3.0.hp),
            SizedBox(
              height: 70.0.hp,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => QuestionCard(
                  question: controller.questions[index],
                  controller: controller,
                  currentQuestion: controller.questions[index].question!),
                controller: controller.pageController,
                itemCount: controller.questions.length,  
                ),
            ),
            const SizedBox(height: 20)
          ],
        )
      ],
    );
  }
}
