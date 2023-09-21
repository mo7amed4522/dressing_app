// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:dressing_app/controller/register_screen_controller/register_screen_controller.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/core/func/auth/valid_input.dart';
import 'package:dressing_app/view/widget/login_screen_widget/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
      body: GetBuilder<RegisterScreenControllerIMP>(
        init: RegisterScreenControllerIMP(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: controller.goBack, color: Theme.of(context).primaryColor),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: Get.height - 3.h),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formState,
                      child: Column(
                        children: [
                          LogoImageWidget(),
                          Text('Create an account'.tr, style: Theme.of(context).textTheme.displayLarge),
                          Text('Welcome , enter your details so lets get started in ordering Dress.'.tr, style: Theme.of(context).textTheme.displayMedium),
                          SizedBox(height: 3.h),
                          CustomTextFormFild(
                            mycontroller: controller.nameController,
                            hintText: "Enter your Name".tr,
                            lable: "Name".tr,
                            suffixIcon: CupertinoIcons.person,
                            textInputType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Name cannot be empty'.tr;
                              }
                            },
                          ),
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
                          CustomTextFormFild(
                            mycontroller: controller.phoneController,
                            hintText: "Enter your Phone".tr,
                            lable: "Phone".tr,
                            suffixIcon: CupertinoIcons.phone,
                            textInputType: TextInputType.emailAddress,
                            validator: (val) {
                              return validInput(val!, 5, 100, "phone");
                            },
                          ),
                          CustomTextFormFild(
                            mycontroller: controller.placeController,
                            hintText: "Enter your City".tr,
                            lable: "City".tr,
                            suffixIcon: CupertinoIcons.house,
                            textInputType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'City cannot be empty'.tr;
                              }
                            },
                          ),
                          CustomTextFormFild(
                            mycontroller: controller.ageController,
                            hintText: "Enter your Age".tr,
                            lable: "AGE".tr,
                            suffixIcon: CupertinoIcons.calendar,
                            textInputType: TextInputType.text,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Age cannot be empty'.tr;
                              }
                            },
                          ),
                          Spacer(),
                          ButtomLoginWidget(
                            buttonName: 'Sign up'.tr,
                            ontap: () {
                              if (formState.currentState!.validate()) {
                                controller.registerNewAccount();
                              } else {}
                            },
                          ),
                          SizedBox(height: 7.h),
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
    );
  }
}
