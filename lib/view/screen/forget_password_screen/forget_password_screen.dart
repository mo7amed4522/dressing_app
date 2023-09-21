// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:dressing_app/controller/foreget_password_screen_controller/forget_password_screen_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/core/func/auth/valid_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
      body: GetBuilder<ForgetPasswordScreenControllerIMP>(
        init: ForgetPasswordScreenControllerIMP(),
        builder: (controller) => Form(
          key: formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: controller.goBack,
                  color: Theme.of(context).primaryColor),
              Center(
                child: SvgPicture.asset(
                  AppPhotoLink.forgetPassword,
                  width: Get.width,
                  height: 30.h,
                  color: Theme.of(context).primaryColor,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 3.h),
              Center(
                child: Text(
                  'forgetPassword'.tr,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Center(
                child: Text(
                  'forgetPassword1'.tr,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 9.h),
              CustomTextFormFild(
                mycontroller: controller.emailController,
                hintText: "Enter your e-mail".tr,
                lable: "Email".tr,
                suffixIcon: CupertinoIcons.envelope_fill,
                textInputType: TextInputType.emailAddress,
                validator: (val) {
                  return validInput(val!, 5, 100, "email");
                },
              ),
              Spacer(),
              Center(
                child: ButtomLoginWidget(
                  buttonName: 'sendCode'.tr,
                  ontap: () {
                    if (formState.currentState!.validate()) {
                      controller.getUserData();
                    } else {}
                  },
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}
