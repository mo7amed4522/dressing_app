// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home_screen_controller/home_screen_controller.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.sp, bottom: 18.sp, right: 4.sp),
      height: 8.h,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(blurRadius: 30, offset: const Offset(0, 10)),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: GetBuilder<HomeScreenControllerIMP>(
        init: HomeScreenControllerIMP(),
        builder: (controller) => ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.changeIndex(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == controller.currentIndex ? Get.width * .35 : Get.width * .154,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == controller.currentIndex ? Get.width * .14 : 0,
                    width: index == controller.currentIndex ? Get.width * .33 : 0,
                    decoration: BoxDecoration(
                      color: index == controller.currentIndex ? Theme.of(context).primaryColor : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  //width: index == controller.currentIndex ? Get.width * .12 : Get.width * .15,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == controller.currentIndex ? Get.width * .18 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == controller.currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(index == controller.currentIndex ? controller.listOfName[index] : '', style: Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == controller.currentIndex ? Get.width * .06 : 20,
                          ),
                          SvgPicture.asset(
                            controller.listOfIcons[index],
                            width: Get.width * .076,
                            color: index == controller.currentIndex ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!.color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
