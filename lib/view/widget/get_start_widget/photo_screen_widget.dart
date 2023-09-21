import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class StartLogoWidget extends StatelessWidget {
  const StartLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          AppPhotoLink.startLogo,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.contain,
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 8.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'start'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        )
      ],
    );
  }
}
