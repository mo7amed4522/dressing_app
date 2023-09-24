// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:dressing_app/controller/product_screen_controller/product_screen_controller.dart';
import 'package:dressing_app/core/constants/app_photo.dart';
import 'package:dressing_app/core/constants/companent.dart';
import 'package:dressing_app/view/widget/product_screen_widget/like_unlike_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      body: GetBuilder<ProductScreenControllerIMP>(
        init: ProductScreenControllerIMP(),
        builder: (controller) => controller.dataProductModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(17.sp), topRight: Radius.circular(17.sp)),
                    child: SizedBox(
                      height: 40.h,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: controller.dataProductModel!.photos!.length,
                          itemBuilder: (context, snapshot) {
                            return Image.network(
                              controller.dataProductModel!.photos![snapshot].imageUrl!,
                              width: Get.width,
                              height: 40.h,
                              fit: BoxFit.cover,
                              errorBuilder: (context, i, n) => Image.asset(
                                AppPhotoLink.logo,
                                height: 20.h,
                                width: Get.width,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 0,
                    left: 0,
                    child: TopStoryLineWidget(
                      pageController: pageController,
                      images: controller.dataProductModel!.photos ?? [],
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
                    top: 41.h,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Center(child: Text(controller.dataProductModel!.name!, style: Theme.of(context).textTheme.labelMedium)),
                              SizedBox(height: 2.h),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 10.sp), child: Text('price'.tr, style: Theme.of(context).textTheme.labelMedium)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  boxPriceWidget('price1'.tr, controller.dataProductModel!.price3 == 0 ? controller.dataProductModel!.price1.toString() : controller.dataProductModel!.price3.toString(), context),
                                  boxPriceWidget('price2'.tr, controller.dataProductModel!.price4 == 0 ? controller.dataProductModel!.price2.toString() : controller.dataProductModel!.price4.toString(), context),
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
                                    initialRating: controller.dataProductModel!.rate!.toDouble(),
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                child: Text('des'.tr, style: Theme.of(context).textTheme.labelMedium),
                              ),
                              SizedBox(
                                width: Get.width,
                                child: Text(controller.dataProductModel!.description!, style: Theme.of(context).textTheme.bodyMedium),
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.h),
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      ontap: controller.goToMakeOrderScreen,
                      buttonName: "order".tr,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
