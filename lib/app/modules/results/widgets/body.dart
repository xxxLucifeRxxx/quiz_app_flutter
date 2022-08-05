// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app_flutter/core/utils/percent_size.dart';

import '../../../../routes/routes.dart';
import '../../../widgets/custom_button.dart';
import '../controller.dart';

class ResultsBody extends StatelessWidget {
  final ResultsController controller;

  const ResultsBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.blueGrey),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Congratulation', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white)),
              SizedBox(height: 10.0.hp),
              Text('Your Score is', style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)),
              SizedBox(height: 7.0.hp),
              Text('${controller.countOfCorrectAnswers}/10', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.amber)),
              SizedBox(height: 2.0.hp),
              CustomButton(onPressed: () => controller.saveResults(), text: 'Save Results'),
              SizedBox(height: 3.0.hp),
              CustomButton(onPressed: () => Get.offAllNamed(Routes.HOME), text: 'Back to Menu')  
          ]),
        )
      ],
    );
  }
}