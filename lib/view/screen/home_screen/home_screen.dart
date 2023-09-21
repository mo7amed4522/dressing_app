// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dressing_app/controller/home_screen_controller/home_screen_controller.dart';
import 'package:dressing_app/view/widget/home_screen_widget/custom_bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GetBuilder<HomeScreenControllerIMP>(
          init: HomeScreenControllerIMP(),
          builder: (controller) => Column(
            children: [
              SizedBox(height: 1.h),
              SizedBox(
                height: 8.h,
                width: Get.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        controller.listOfName[controller.currentIndex],
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp), topRight: Radius.circular(30.sp))),
                  child: Stack(
                    children: [
                      controller.screen[controller.currentIndex],
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: const CustomBottomNavBarWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
