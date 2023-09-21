// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:dressing_app/controller/login_screen_controller/login_screen_controller.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/core/func/auth/valid_input.dart';
import 'package:dressing_app/view/widget/login_screen_widget/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GetBuilder<LoginScreenControllerIMP>(
          init: LoginScreenControllerIMP(),
          builder: (controller) => Column(
            children: [
              SizedBox(height: 3.h),
              SizedBox(
                height: 30.h,
                child: Column(
                  children: [LogoImageWidget(), Text('Login to your account'.tr, style: Theme.of(context).textTheme.displayLarge), SizedBox(height: 2.h), Text('Good to see you again, enter your details below to continue ordering.'.tr, style: Theme.of(context).textTheme.displayMedium)],
                ),
              ),
              Form(
                key: formState,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: Get.height - 31.h),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
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
                            SizedBox(height: 2.h),
                            CustomTextFormFild(
                              mycontroller: controller.passwordController,
                              hintText: "Enter your password".tr,
                              lable: "Passowrd".tr,
                              suffixIcon: controller.iconDate,
                              isShowText: controller.isShowPassword,
                              sufficsIconTap: controller.changeShowPassword,
                              textInputType: TextInputType.visiblePassword,
                              validator: (val) {
                                return validInput(val!, 5, 100, "password");
                              },
                            ),
                            SizedBox(height: 2.h),
                            InkWell(onTap: controller.goToForgetPassword, child: Padding(padding: EdgeInsets.symmetric(horizontal: 19.sp, vertical: 4.sp), child: Align(alignment: Alignment.centerRight, child: Text('forget'.tr, style: Theme.of(context).textTheme.displayMedium)))),
                            Spacer(),
                            ButtomLoginWidget(
                              buttonName: 'Login to my account'.tr,
                              ontap: () {
                                if (formState.currentState!.validate()) {
                                  controller.onLoginTap();
                                } else {}
                              },
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?".tr, style: Theme.of(context).textTheme.bodyMedium),
                                InkWell(onTap: controller.goToSignUpScreen, child: Text(" Register NOW!".tr, style: Theme.of(context).textTheme.labelLarge)),
                              ],
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),
                    ),
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
