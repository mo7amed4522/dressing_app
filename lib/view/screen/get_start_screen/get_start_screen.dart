import 'package:dressing_app/controller/get_start_screen_controller/get_start_screen_controller.dart';
import 'package:dressing_app/view/widget/get_start_widget/photo_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetStartScreenControllerIMP>(
        init: GetStartScreenControllerIMP(),
        builder: (controller) => const StartLogoWidget(),
      ),
    );
  }
}
