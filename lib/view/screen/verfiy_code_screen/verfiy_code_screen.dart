// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, avoid_print

import 'package:dressing_app/controller/verfiy_code_screen_controller/verfiy_code_screen_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VerfiyCodeScreen extends StatelessWidget {
  const VerfiyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VerfiyCodeScreenControllerIMP>(
        init: VerfiyCodeScreenControllerIMP(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: controller.goBack, color: Theme.of(context).primaryColor),
            Center(
              child: SvgPicture.asset(
                AppPhotoLink.verfiyCode,
                width: Get.width,
                height: 30.h,
                color: Theme.of(context).primaryColor,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 3.h),
            Center(child: Text('verifiy'.tr, style: Theme.of(context).textTheme.displayMedium)),
            SizedBox(height: 3.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
              child: OtpTextField(
                numberOfFields: 5,
                disabledBorderColor: Theme.of(context).canvasColor,
                enabledBorderColor: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color!,
                borderColor: Theme.of(context).primaryColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  controller.verfiyCodeOtp = code;
                },
                onSubmit: (String verificationCode) {
                  controller.verfiyCodeOtp = verificationCode;
                }, // end
              ),
            ),
            Spacer(),
            Center(
              child: ButtomLoginWidget(
                buttonName: 'Confirm'.tr,
                ontap: () {
                  if (controller.verfiyCodeOtp!.isEmpty || controller.verfiyCodeOtp!.length < 5) {
                    Get.snackbar('Error !! This', 'Please fill the OTP field', snackPosition: SnackPosition.BOTTOM);
                  } else {
                    controller.verfiyCode(controller.verfiyCodeOtp!);
                  }
                },
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
