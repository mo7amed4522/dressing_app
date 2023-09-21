// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dressing_app/controller/account_bottom_navbar_widget_controller/account_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/widget/circle_avatar_widget.dart';
import 'package:dressing_app/view/widget/account_bottom_navbar_widget/widget/custom_card_title_widgget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountBottomNavBarWidget extends StatelessWidget {
  const AccountBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountBottomNavBarWidgetControllerIMP>(
      init: AccountBottomNavBarWidgetControllerIMP(),
      builder: (controller) => SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Center(child: CircleAvatarWidget()),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: Get.height - 30.h),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        CustomCardTitleWidget(titleName: 'updatedata'.tr, onCardTB: controller.goToEditScreen),
                        SizedBox(height: 1.h),
                        CustomCardTitleWidget(titleName: 'mode'.tr, onCardTB: controller.onChngeThemesClick),
                        SizedBox(height: 1.h),
                        CustomCardTitleWidget(titleName: 'lang'.tr, onCardTB: controller.onChangeLangTap),
                        SizedBox(height: 1.h),
                        CustomCardTitleWidget(titleName: 'termuse'.tr, onCardTB: controller.onTermsOfUseTap),
                        SizedBox(height: 1.h),
                        CustomCardTitleWidget(titleName: 'privacypolicy'.tr, onCardTB: controller.onPrivacyPolicyTap),
                        SizedBox(height: 1.h),
                        CustomCardTitleWidget(titleName: 'logout'.tr, onCardTB: controller.onLogoutClick),
                      ],
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
