// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller.dart';

class CategoriesDropdown extends StatelessWidget {
  final HomeController controller;

  const CategoriesDropdown({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Choose Category',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)),
        SizedBox(
          width: double.infinity,
          child: Obx(() => DropdownButton<String>(
              dropdownColor: Colors.lightBlueAccent,
              iconSize: 30,
              isExpanded: true,
              value: controller.chooseCategories.value,
              items: controller.categoriesMap
                  .map((categories, value) {
                    return MapEntry(
                      categories,
                      DropdownMenuItem(
                        value: categories,
                        child: Center(
                            child: Text(categories,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.white))),
                      ),
                    );
                  })
                  .values
                  .toList(),
              onChanged: (value) {
                controller.chooseCategories.value = value!;
              })),
        ),
      ],
    );
  }
}
