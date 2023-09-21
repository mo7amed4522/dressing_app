// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:dressing_app/controller/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/core/func/auth/valid_input.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/widget/circle_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
      body: GetBuilder<EditProfileScreenControllerIMP>(
        init: EditProfileScreenControllerIMP(),
        builder: (controller) => Column(
          children: [
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: controller.goBack, color: Theme.of(context).primaryColor),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp), child: InkWell(onTap: controller.editTextFormFieldTap, child: SvgPicture.asset(AppPhotoLink.editLogo, width: 2.w, height: 4.h, color: Theme.of(context).primaryColor))),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: Get.height - 4.h),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formState,
                      child: Column(
                        children: [
                          Align(alignment: Alignment.center, child: CircleAvatarWidget()),
                          CustomTextFormFild(
                            mycontroller: controller.nameController,
                            hintText: "Enter your Name".tr,
                            lable: "Name".tr,
                            suffixIcon: CupertinoIcons.person,
                            enabled: controller.isEdit,
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
                            enabled: controller.isEdit,
                            lable: "Email".tr,
                            suffixIcon: CupertinoIcons.envelope_fill,
                            textInputType: TextInputType.emailAddress,
                            validator: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                          ),
                          CustomTextFormFild(
                            mycontroller: controller.phoneController,
                            hintText: "Enter your Phone".tr,
                            lable: "Phone".tr,
                            enabled: controller.isEdit,
                            suffixIcon: CupertinoIcons.phone,
                            textInputType: TextInputType.emailAddress,
                            validator: (val) {
                              return validInput(val!, 5, 100, "phone");
                            },
                          ),
                          CustomTextFormFild(
                            mycontroller: controller.confimPhonenumberController,
                            hintText: "Enter your confPhone".tr,
                            lable: "confPhone".tr,
                            enabled: controller.isEdit,
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
                            enabled: controller.isEdit,
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
                            enabled: controller.isEdit,
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
                            buttonName: 'edit'.tr,
                            ontap: () {
                              if (formState.currentState!.validate()) {
                                controller.onEditButtonClick();
                              } else {}
                            },
                          ),
                          SizedBox(height: 10.h),
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
