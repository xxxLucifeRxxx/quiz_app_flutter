// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/app/widgets/custom_button.dart';
import 'package:quiz_app_flutter/core/utils/percent_size.dart';

import '../controller.dart';
import 'categories_dropdown.dart';
import 'difficulty_dropdown.dart';

class HomeBody extends StatelessWidget {
  final HomeController controller;

  const HomeBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: Colors.lightBlueAccent),
      Column(
        children: [
          SizedBox(height: 3.0.hp),
          Text('QUIZ GAME', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.amber)),
          SizedBox(height: 25.0.hp),
          CategoriesDropdown(controller: controller),
          SizedBox(height: 3.0.hp),
          DifficultyDropdown(controller: controller),
          SizedBox(height: 25.0.hp),
          CustomButton(onPressed: () => controller.start(), text: 'Start'),
        ],
      ),
    ]);
  }
}
