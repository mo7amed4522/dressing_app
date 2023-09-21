// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:dressing_app/controller/cart_bottom_navbar_widget_controller/cart_bottom_navbar_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTapViewCollection extends StatelessWidget {
  const CustomTapViewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartBottomNavBarWidgetControllerIMP>(
      init: CartBottomNavBarWidgetControllerIMP(),
      builder: (controller) => controller.dataCollectionModel.isEmpty
          ? Container(margin: EdgeInsets.symmetric(horizontal: 10.sp), alignment: Alignment.center, child: Text('noProd'.tr, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center))
          : Container(
              padding: EdgeInsets.only(top: 7.h),
              margin: EdgeInsets.symmetric(horizontal: 5.sp),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
              child: ListView.separated(
                itemCount: controller.dataCollectionModel.length,
                separatorBuilder: (context, index) => SizedBox(height: 2.h),
                itemBuilder: (context, index) => Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Theme.of(context).colorScheme.error),
                        child: SizedBox(
                          width: Get.width,
                          height: 18.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('codeOrder'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                      Text("( ${controller.dataCollectionModel[index].orderRentID.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('amount'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                      Text("  ( ${controller.dataCollectionModel[index].amount.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('createat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                  Text(controller.dataCollectionModel[index].createdAt!, style: Theme.of(context).textTheme.headlineMedium),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('updateat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                  Text(controller.dataCollectionModel[index].updateAt!, style: Theme.of(context).textTheme.headlineMedium),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('endat'.tr, style: Theme.of(context).textTheme.bodyMedium),
                                  Text(controller.dataCollectionModel[index].endAt!, style: Theme.of(context).textTheme.headlineMedium),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('priceat'.tr, style: Theme.of(context).textTheme.bodyLarge),
                                      Text("( ${controller.dataCollectionModel[index].totalPrice.toString()} )", style: Theme.of(context).textTheme.labelMedium),
                                    ],
                                  ),
                                  Container(
                                    width: 20.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(color: Theme.of(context).colorScheme.error.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.dataCollectionModel[index].payNow == 0 ? 'wait'.tr : 'accept'.tr,
                                        textAlign: TextAlign.center,
                                        style: controller.dataCollectionModel[index].payNow == 0 ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.headlineMedium,
                                      ),
                                    ),
                                  ),
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
