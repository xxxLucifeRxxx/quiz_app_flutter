// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../data/enums/difficulty.dart';
import '../controller.dart';

class DifficultyDropdown extends StatelessWidget {
  final HomeController controller;

  const DifficultyDropdown({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Choose Difficulty',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
        SizedBox(
          width: double.infinity,
          child: Obx(() => DropdownButton(
              dropdownColor: Colors.lightBlueAccent,
              isExpanded: true,
              value: controller.difficulty.value,
              items: DifficultyEnum.values.map((difficulty) {
                return DropdownMenuItem(
                  value: difficulty,
                  child: Center(
                      child: Text(difficulty.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white))),
                );
              }).toList(),
              onChanged: (DifficultyEnum? value) {
                controller.difficulty.value = value!;
              })),
        ),
      ],
    );
  }
}
