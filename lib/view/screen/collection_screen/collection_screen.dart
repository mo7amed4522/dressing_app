// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:dressing_app/controller/collecrion_screen_controller/collection_screen_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/view/widget/collection_screen_widget/like_unlike_btn_widget.dart';
import 'package:dressing_app/view/widget/collection_screen_widget/top_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CollectionScreenControllerIMP>(
        init: CollectionScreenControllerIMP(),
        builder: (controller) => Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                controller.dataCollectionList!.photo!,
                width: Get.width,
                height: 40.h,
                fit: BoxFit.cover,
                errorBuilder: (c, n, x) => Image.asset(
                  AppPhotoLink.logo,
                  width: Get.width,
                  height: 12.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 4.h,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.error.withOpacity(0.30),
                ),
                child: Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.only(right: 0.0001),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.60),
                    ),
                    child: IconButton(
                      onPressed: controller.goBack,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Theme.of(context).primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 37.h,
              right: Get.width - 13.w,
              child: LikUnLikBtnWidgetAnimation(
                like: controller.like,
                onLikeBtnTap: controller.onLikeBtnTap,
              ),
            ),
            Positioned(
              top: 40.h,
              bottom: 0.h,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Container(width: Get.width, alignment: Alignment.center, child: Text(controller.dataCollectionList!.collectionName!, style: Theme.of(context).textTheme.labelMedium)),
                    SizedBox(height: 2.h),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text('prod'.tr, style: Theme.of(context).textTheme.labelMedium)),
                    TopBarWidgetProductCollection(),
                    SizedBox(height: 2.h),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text('price'.tr, style: Theme.of(context).textTheme.labelMedium)),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        boxPriceWidget('price1'.tr, controller.dataCollectionList!.price1.toString(), context),
                        SizedBox(width: 3.w),
                        boxPriceWidget('price2'.tr, controller.dataCollectionList!.price2.toString(), context),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text('rate'.tr, style: Theme.of(context).textTheme.labelMedium)),
                        SizedBox(width: 6.w),
                        Icon(CupertinoIcons.hand_point_left_fill, size: 20.sp, color: Theme.of(context).colorScheme.onSecondary),
                        SizedBox(width: 11.w),
                        AnimatedRatingStars(
                          initialRating: controller.dataCollectionList!.rate!.toDouble(),
                          minRating: 0.0,
                          maxRating: 5.0,
                          filledColor: Theme.of(context).colorScheme.secondary,
                          emptyColor: Theme.of(context).primaryColor,
                          filledIcon: CupertinoIcons.star_fill,
                          halfFilledIcon: CupertinoIcons.star_lefthalf_fill,
                          emptyIcon: CupertinoIcons.star,
                          onChanged: (double rating) {},
                          displayRatingValue: true,
                          interactiveTooltips: true,
                          customFilledIcon: CupertinoIcons.star_fill,
                          customHalfFilledIcon: CupertinoIcons.star_lefthalf_fill,
                          customEmptyIcon: CupertinoIcons.star,
                          starSize: 20.0,
                          animationDuration: Duration(milliseconds: 300),
                          animationCurve: Curves.easeInOut,
                          readOnly: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text('des'.tr, style: Theme.of(context).textTheme.labelMedium)),
                    Container(width: Get.width, padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text(controller.dataCollectionList!.description!, style: Theme.of(context).textTheme.bodyMedium)),
                    SizedBox(height: 17.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtomLoginWidget(
                  buttonName: 'order'.tr,
                  ontap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
