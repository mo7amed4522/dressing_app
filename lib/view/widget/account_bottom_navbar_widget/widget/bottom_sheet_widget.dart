// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:ui';

import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomSheetLogOutWidget extends StatelessWidget {
  final VoidCallback onConfirmTap;
  final VoidCallback onCancelTap;
  const BottomSheetLogOutWidget({Key? key, required this.onConfirmTap, required this.onCancelTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10, tileMode: TileMode.mirror),
          child: Stack(
            children: [
              Container(width: Get.width, color: Theme.of(context).colorScheme.background.withOpacity(0.3)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                width: Get.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [Text('conf'.tr, style: Theme.of(context).textTheme.labelMedium), SizedBox(width: 2.w), Text('logout'.tr, style: Theme.of(context).textTheme.labelMedium)]),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Center(child: Text('bodylog1'.tr, style: Theme.of(context).textTheme.displaySmall)),
                          Center(child: Text('bodylog2'.tr, style: Theme.of(context).textTheme.displaySmall)),
                          SizedBox(height: 2.h),
                          Center(child: SvgPicture.asset(AppPhotoLink.logoutLogo, width: Get.width, height: 14.h, fit: BoxFit.contain, color: Theme.of(context).colorScheme.onBackground)),
                          Spacer(),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [SizedBox(width: Get.width / 2.3, child: ButtomLoginWidget(ontap: onConfirmTap, buttonName: 'logout'.tr)), SizedBox(width: Get.width / 2.3, child: ButtomLoginWidget(ontap: onCancelTap, buttonName: 'cancle'.tr))]),
                        ],
                      ),
                    ),
                    SizedBox(height: 23),
                    SizedBox(
                      width: Get.width / 1.3,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'cond'.tr, style: Theme.of(context).textTheme.labelSmall),
                            TextSpan(text: 'termuse'.tr, style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(text: "and".tr, style: Theme.of(context).textTheme.labelSmall),
                            TextSpan(text: 'privacypolicy'.tr, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
