// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:dressing_app/controller/favoriet_bottom_navbar_widget_controller/favoriet_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/view/widget/favorit_bottom_navbar_widget/widget/custom_card_view_prod_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomCardLoveViewWidget extends StatelessWidget {
  const CustomCardLoveViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavorietBottomNvaBarWidgetControllerIMP>(
      init: FavorietBottomNvaBarWidgetControllerIMP(),
      builder: (controller) => controller.isLoading == false
          ? CustomCardViewProductShimmer()
          : controller.data == null
              ? Center(
                  child: Text(
                    'noProd'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(top: 7.h),
                  margin: EdgeInsets.symmetric(horizontal: 5.sp),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
                  child: ListView.separated(
                    itemCount: controller.data!.length,
                    separatorBuilder: (context, index) => SizedBox(height: 2.h),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.goToProductScreen(prodID: controller.data![index].prodId);
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Theme.of(context).colorScheme.error),
                            child: SizedBox(
                              width: Get.width,
                              height: 17.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    height: 17.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp)),
                                      child: Image.network(
                                        controller.data![index].image!,
                                        width: 10.w,
                                        height: 17.h,
                                        fit: BoxFit.cover,
                                        errorBuilder: (c, n, s) => Image.asset(
                                          AppPhotoLink.logo,
                                          width: 10.w,
                                          height: 17.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(controller.data![index].name!, style: Theme.of(context).textTheme.labelMedium),
                                      AnimatedRatingStars(
                                        initialRating: controller.data![index].rate!.toDouble(),
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
                                      )
                                    ],
                                  ),
                                ],
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
