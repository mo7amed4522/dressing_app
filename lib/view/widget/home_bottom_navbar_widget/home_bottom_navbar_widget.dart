// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dressing_app/controller/home_bottom_navbar_widgt_controller/home_bottom_navbar_widget_controller.dart';
import 'package:dressing_app/view/widget/home_bottom_navbar_widget/widget/card_of_department_widget.dart';
import 'package:dressing_app/view/widget/home_bottom_navbar_widget/widget/custom_card_product_shimmer_widget.dart';
import 'package:dressing_app/view/widget/home_bottom_navbar_widget/widget/custom_card_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeBottomNavBarWidget extends StatelessWidget {
  const HomeBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBottomNavBarWidgetControllerIMP>(
      init: HomeBottomNavBarWidgetControllerIMP(),
      builder: (controller) => controller.dataOfCollection == null
          ? Center(
              child: Text('Error At Server very Sorry !!'.tr, style: Theme.of(context).textTheme.displayLarge),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Text('Dep'.tr, style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(height: 1.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
                  height: 23.h,
                  width: Get.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dataOfCollection!.length,
                    separatorBuilder: (context, index) => SizedBox(width: 3.w),
                    itemBuilder: (context, index) => CardOfDepartmentWidget(
                      dep_name: controller.dataOfCollection![index].depName!,
                      photoImage: controller.dataOfCollection![index].depPhoto!,
                      onDepTap: () {
                        controller.getProductByID(id: controller.dataOfCollection![index].depId);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 3.sp),
                  child: Text('prod'.tr, style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(
                  height: Get.height - 46.2.h,
                  width: Get.width,
                  child: controller.isLoading == false
                      ? GridView.builder(
                          itemCount: 3,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 8,
                            childAspectRatio: (1),
                          ),
                          itemBuilder: (context, index) => CustomCardShimmerWidget(),
                        )
                      : controller.productData == null
                          ? Center(
                              child: Text(
                                'nodata'.tr,
                                style: Theme.of(context).textTheme.displayLarge,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : GridView.builder(
                              itemCount: controller.productData!.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 8,
                                childAspectRatio: (1),
                              ),
                              itemBuilder: (context, index) => CustomCardProductWidget(
                                onProductBtn: () {
                                  controller.goToProductScreen(controller.productData![index].prodId!);
                                },
                                photoImage: controller.productData![index].image!,
                                prodName: controller.productData![index].name!,
                              ),
                            ),
                ),
              ],
            ),
    );
  }
}
