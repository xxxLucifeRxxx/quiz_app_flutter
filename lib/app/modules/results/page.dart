// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'controller.dart';
import 'widgets/body.dart';

class ResultsPage extends GetView<ResultsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey),
      body: SafeArea(child: controller.obx((state) => ResultsBody(controller: controller,))),
    );
  }
}
